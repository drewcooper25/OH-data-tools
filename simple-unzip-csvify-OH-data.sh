# simple-conversion-OH-data.sh
# note: do NOT use gzip frivilously. can very easily overwrite data, make files 0 KB, etc.
# more gunzip: https://www.lifewire.com/example-uses-of-the-gunzip-command-4081346

ls -d /Users/user/Desktop/OH/MyProjectData/20104403/direct-sharing-31/ | while read dir; do
  echo "Starting participant $dir"

  # type = entries profile treatments devicestatus
  for type in entries; do #split devicestatus...

    #cd $dir/next_participant_folder

    # convert from zip to json
    cd $dir
    ls ${type}*.gz | while read file; do #look into sed...
      gunzip -k ${file}
      echo "Extracted ${dir}${file}; splitting it..."
    done

      # convert from json into csv
    cd ${dir}
      echo "Creating CSV files..."
    ls ${type}*.json | while read file; do
      complex-json2csv ${file} > ${file}.csv
    done

    # output csv export list
    cd /${dir}${file}
      echo -n "Participant $dir: $file CSV files created:"
    ls *$file*.csv | wc -l
    cd /
      echo

    # exit csv and return to parent directory
    cd ../../
    done
  done
