@extends('layouts.front')
@section('title')
    Blog Note-IT
@endsection
@section('style')    
<style>
    a{
        text-decoration: none !important;
        /* color: #636b6f !important; */
    }
    .jumbotron{ 
		padding-top:100px;
        height: 360px;
        background: linear-gradient(to right, #4dd599,#FFFF00 99%);
    }
    .card img{
        width: 100%;
        height: 200px;
    }

    #blog{
        padding-bottom: 40px;
    }

    @keyframes come{
        0%{
            opacity: 0;
        }

        100%{
            opacity: 1;
        }
    }

    .card{
        margin-top: 6%;
        height: 420px;
        padding-bottom: 10px;
    }

    .card-body{ 
        overflow: hidden; 
    }

    .btn-primary{
        color: #ffffff !important;
    }

</style>
@endsection

@section('content')
    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <h1 class="display-3">Welcome to Blog Note-IT</h1>
            <p class="lead">CodeQ just note of system engginer, network engginer, database engginer and coder</p>
            <hr class="my-2">
            <p class="lead">
                <a class="btn btn-primary btn-lg" href="/blog" role="button">Read A Post</a>
            </p>
        </div>
    </div>    
        <div id="blog">
            <div class="container">
                <div class="row">
                    @foreach ($posts as $post)
                    <div class="col-lg-4">
                        <a href="{{route('post.show', $post->slug)}}">
                        <div class="card">
                            <img src="{{$post->getPhotoUrl()}}">
                            <div class="card-body">
                                <h3><strong>{{$post->title}}</strong></h3>
                                {!! $post->body !!} <br>
                            </div>
                            <div class="container mt-3">
                                <span>Kategori : <strong>{{$post->category->category_name}}</strong></span><br>
                                @foreach ($post->tags as $tag)
                                    <span class="badge badge-success">#{{$tag->tag_name}}</span>
                                @endforeach
                            </div>
                        </div>
                        </a>
                    </div>
                    @endforeach
                </div>
				<div class="row">
				<div class="mx-auto">
				  <a href="/" class="mt-4 btn btn-info">First Page</a>
					<a href="?page={{$posts->currentPage() - 1}}" class="mt-4 btn btn-info">Back</a>                    
			   

					<a href="?page={{$posts->currentPage() + 1}}" class="mt-4 btn btn-info">Next</a>
					<a href="?page={{$posts->lastPage()}}" class="mt-4 btn btn-info">Last Page</a>
				</div>
				</div>
            </div>
        </div>



@endsection
@section('script')
<script>
        const container = document.querySelector('.container-portfolio')
        const jumbo = document.querySelector('.jumbo')
        const thumbs = document.querySelectorAll('.gambar')
		
		
		console.log(container); // null

		// ✅ Check if element exists before calling addEventListener()
		if (container) {
		  // Not called
		    container.addEventListener('click', function(e){
				if(e.target.className == 'gambar'){
					jumbo.src = e.target.src
					jumbo.classList.add('feid')
					setTimeout(function(){
						jumbo.classList.remove('feid')
					}, 500)
				}

				thumbs.forEach(function(thumb){
					if(thumb.classList.contains('aktif')){
						thumb.classList.remove('aktif')
					}
				})

				e.target.classList.add('aktif')
			});
		}


</script>
@endsection