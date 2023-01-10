@extends('layouts.front')
@section('title')
    Blog Note-IT
@endsection

@section('style')    
    <style>
    .box-post{
        background: #fff;
        height: 180px;
        box-shadow: 0px 0px 3px 0px rgba(200, 200, 200, 0.3);
        margin-top: 3%;
    }

    .box-post img{
        width: 100%;
        padding: 20px;  
    }
    .body{
        height: 100px;
        overflow: hidden;
        text-align: justify;
        padding-right: 20px;
        font-size: 12px;
    }

    .box{
        background: #fff !important;
        box-shadow: 0 2px 4px rgba(120, 120, 120, 0.3);
        border-radius: 10px;
        margin-top: 25px;
    }
    a{
        text-decoration: none !important;
    }
    .col-lg-9 a{
        color: #333 !important; 
    }
    li{
        list-style: none;
    }
    .category-wrap{
        margin-left: -40px;
    }
    .link-category{
        margin-top: 10px;
        padding: 9px;
        background: #fff;
        color: #333 !important;
        box-shadow: 0 2px 5px rgba(120, 120, 120, 0.3);
        border-radius: 5px;
    }
    .link-category:hover{
        transform: scale(1.02);
        background: #f2f8ff;
    }
    .box-tags{
        background: #fff !important;
        box-shadow: 0 2px 4px rgba(120, 120, 120, 0.3);
        border-radius: 10px;
    }
	
	/* Small devices (landscape phones, 544px and up) */
@media (min-width: 344px) {  
  h2 {font-size:0.9rem;} /*1rem = 15px*/
}
 
/* Medium devices (tablets, 768px and up) The navbar toggle appears at this breakpoint */
@media (min-width: 768px) {  
  h2 {font-size:1.2rem;} /*1rem = 16px*/
}
 
/* Large devices (desktops, 992px and up) */
@media (min-width: 992px) { 
  h2 {font-size:1.6rem;} /*1rem = 16px*/
}
    </style>
@endsection

@section('content')
    <div class="container mt-5">
        <div class="row pt-2">
            <div class="col-lg-9">
                @foreach ($posts as $post)
                <div class="box-post">
                    <div class="row">
                        <div class="col-4">
                            <a href="{{route('post.show', $post->slug)}}">
                                <img src="{{$post->getPhotoUrl()}}" alt="">
                            </a>
                        </div>
                        <div class="col-8 p-2">
                            <div class="body">
                                <a href="{{route('post.show', $post->slug)}}"><h2><strong>{{$post->title}}</strong></h2> </a>
                                {!! $post->body !!}
                            </div>
                        
                            <div class="foot mt-3">
                                <span>Kategori : <strong>{{$post->category->category_name}}</strong></span><br>
                                @foreach ($post->tags as $tagPost)
                                <span class="badge badge-success">#{{$tagPost->tag_name}}</span>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
                @endforeach
		
         
                <a href="/blog" class="mt-4 btn btn-info">First Page</a>
                <a href="/blog?page={{$posts->currentPage() - 1}}" class="mt-4 btn btn-info">Back</a>                    
           

                <a href="/blog?page={{$posts->currentPage() + 1}}" class="mt-4 btn btn-info">Next</a>
                <a href="/blog?page={{$posts->lastPage()}}" class="mt-4 btn btn-info">Last Page</a>
            
            </div>

            <div class="col-lg-3">
                <div class="box p-3">
                    <span><strong>Kategori</strong></span>
                    <ul class="mt-2 category-wrap">
                        @foreach ($categories as $category)
                        <a href="/blog/category/{{$category->slug}}"><li class="link-category">{{$category->category_name}}</li></a>
                        @endforeach
                    </ul>
                </div>

                <div class="box-tags p-3 mt-3">
                    <span><strong>Tag</strong></span><br>
                    @foreach ($tags as $tag)
                    <a href="/blog/tag/{{$tag->slug}}">#{{$tag->tag_name}}</a>
                    @endforeach 
                </div>
            </div>
    </div>
@endsection
