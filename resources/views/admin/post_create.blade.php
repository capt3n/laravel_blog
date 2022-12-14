@extends('layouts.app')
@section('title')
    Postingan Baru
@endsection

@section('content')
<div class="container">
    <div class="card">
        <div class="card-header">
            <h4>Postingan Baru</h4>    
        </div>    
        <div class="card-body">
            <form action="{{route('post.store')}}" method="post" enctype="multipart/form-data">
                @csrf
                <input type="hidden" name="user_id" value="{{Auth::user()->id}}">                
                <div class="form-group">
                  <label for="title">Judul Postingan</label>
                  <input type="text" name="title" id="title" class="form-control" aria-describedby="post">
                  <small id="post" class="text-muted">e.g. Cara install xampp</small>
                </div>

                <div class="form-group">
                  <label for="">Gambar Untuk Posingan (Opsional)</label>
                  <input type="file" class="form-control-file" name="photo" aria-describedby="fileHelpId">
                  <small id="fileHelpId" class="form-text text-muted">Masukkan gambar yang menarik perhatian</small>
                </div>

                <div class="form-group">
                    <label for="category">Kategori</label>
                    <select class="custom-select" name="category_id" id="category">
                        <option selected>Pilihi Salah satu</option>
                        @foreach ($categories as $category)
                        <option value="{{$category->id}}">{{$category->category_name}}</option>                       
                        @endforeach
                    </select>
                </div>

            <div class="form-group">
                <label>Tag</label><br>
                @foreach ($tags as $tag)
                <input type="checkbox" name="tag_id[]" value="{{$tag->id}}"><label>{{$tag->tag_name}}</label>                    
                @endforeach
            </div>

          
            <label for="">Isi Postingan</label>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/tinymce/4.9.2/tinymce.min.js" no-api-key referrerpolicy="origin"></script>
            <textarea name="body" class="form-control my-editor"></textarea><br>
            <script>
            var editor_config = {
                path_absolute : "/",
                selector: "textarea.my-editor",
                plugins: [
                "advlist autolink lists link image charmap print preview hr anchor pagebreak",
                "searchreplace wordcount visualblocks visualchars code fullscreen",
                "insertdatetime media nonbreaking save table contextmenu directionality",
                "emoticons template paste textcolor colorpicker textpattern"
                ],
                toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image media",
                relative_urls: false,
                file_browser_callback : function(field_name, url, type, win) {
                var x = window.innerWidth || document.documentElement.clientWidth || document.getElementsByTagName('body')[0].clientWidth;
                var y = window.innerHeight|| document.documentElement.clientHeight|| document.getElementsByTagName('body')[0].clientHeight;

                var cmsURL = editor_config.path_absolute + 'laravel-filemanager?field_name=' + field_name;
                if (type == 'image') {
                    cmsURL = cmsURL + "&type=Images";
                } else {
                    cmsURL = cmsURL + "&type=Files";
                }

                tinyMCE.activeEditor.windowManager.open({
                    file : cmsURL,
                    title : 'Filemanager',
                    width : x * 0.8,
                    height : y * 0.8,
                    resizable : "yes",
                    close_previous : "no"
                });
                }
            };

            tinymce.init(editor_config);
            </script>
            
            <button class="btn btn-info">Simpan Postingan</button>
            <button class="btn btn-warning" name="publish">Publish</button>
            </form>
        </div>
    </div>    
</div>
@endsection