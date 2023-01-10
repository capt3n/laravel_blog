<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use App\Category;
use App\Tag;
use App\Post;
//CloudinaryStorage
use App\Models\Image;
use App\Http\Controllers\CloudinaryStorage;

class blogController extends Controller
{

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $tags = Tag::all();
        $categories = Category::all();
        return view('admin.post_create', compact('categories', 'tags'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {   
        $post = Post::create([
            'user_id' => $request->user_id,
            'category_id' => $request->category_id,
            'title' => $request->title,
            'slug' => str_slug($request->title, '-'),
            'body' => $request->body,
			'photo' => "https://res.cloudinary.com/drliclrj8/image/upload/v1672311828/tutorial/2022-12-29_110346_free-images-for-blog.png",
        ]);
        if($request->hasFile('photo'))
        {
			$image  = $request->file('photo');
			$result = CloudinaryStorage::upload($image->getRealPath(), $image->getClientOriginalName()); 
			$post->photo = $result;
			$post->save();
        }
        $post->tags()->sync($request->tag_id);

        if(isset($_POST['publish'])){
            $post->isPublished = 1;
            $post->save();
        }

        return redirect('/admin/dashboard');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($slug)
    {
        $post = Post::where('slug', $slug)->first();
        return view('blog_show', compact('post'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $tags = Tag::all();
        $categories = Category::all();
        $post = Post::find($id);
        $tag_name = $post->tags()->get();
        return view('admin.post_edit', compact('post', 'categories', 'tags', 'tag_name'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $update = Post::find($id);
        $update->tags()->sync($request->tag_id);
		$requestData = $request->all();
	 	if($request->hasFile('photo'))
        {
			$image  = $request->file('photo');
			$result = CloudinaryStorage::upload($image->getRealPath(), $image->getClientOriginalName()); 
			$requestData['photo'] = $result;
        }
		/* 		else{
			$requestData['photo'] = "https://res.cloudinary.com/drliclrj8/image/upload/v1672307344/tutorial/undraw_walk_in_the_city_1ma6_jeolav.png";
		} */
		
        $update->update($requestData);
		return redirect('/admin/dashboard');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function postDestroy($id)
    {
        Post::destroy($id);
        return redirect()->back();
    }

    public function publish($id){
        $post = Post::find($id);

        if($post->isPublished == 0){
            $post->update(['isPublished' => 1]);
        }else{
            $post->update(['isPublished' => 0]);
        }
        return redirect()->back();
    }



// ==============================Category==============
    public function categoryStore(Request $request){
        Category::create([
            'category_name' => $request->category_name,
            'slug' => str_slug($request->category_name, '-'),
        ]);
        return redirect()->back();
    }

    public function categoryDestroy($id){
        Category::destroy($id);
        return redirect()->back();
    }


// ==========================Tags==================

    public function tagStore(Request $request){
        Tag::create([
            'tag_name' => $request->tag_name,
            'slug' => str_slug($request->tag_name, '-'),
        ]);
        return redirect()->back();
    }

    public function tagDestroy($id){
        Tag::destroy($id);
        return redirect()->back();
    }

}
