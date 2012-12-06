<?php

class producers {
    
    public function get_all_producers(){
        $sql="select * from producers";
        $all_producers=fetch_all($sql);
        return $all_producers;
    }
    
    public function add_record($data){
        $sql="insert into producers(name, logo) values ('".$data['name']."', '".$data['img']."')";
        mysql_query($sql);
         echo '
        <script>
        if (parent.window.hs) {
            var exp = parent.window.hs.getExpander("add_producers");
            if (exp) {
            setTimeout(function() {
            exp.close();
            }, 1000);
            }
        }      
        parent.window.location.reload();
         </script>
      ';
    } 
    
    public function edit_record($data){
      
        $sql="UPDATE producers  SET name='".$data['name']."', logo='".$data['img']."' where id=".$data['edit'];
        mysql_query($sql);
         echo '
        <script>
           
        parent.window.location.reload();
         </script>
      ';
    } 
    public function delete_record($id){
        $sql="delete from producers where id=".$id;
        mysql_query($sql);
          echo '
        <script>
      
            parent.window.location.reload();
         </script>
      ';
    }
    
    public function get_record_by_id($id){
        $sql="select * from producers where id=".$id;
        $record=fetch_all($sql);
        return $record[1];
    }   
}

?>
