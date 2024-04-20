<?php

namespace App\Http\Controllers\Backend\homepage;
use App\Models\Category;
use Illuminate\Http\Request;
use App\Models\frontendSection;
use App\Http\Controllers\Controller;
use App\Http\Requests\aboutSectionReqest;
use App\Http\Requests\blogSectionReqest;
use App\Http\Requests\portfolioRequest;
use App\Http\Requests\mapaddressRequest;
use App\Http\Requests\testmonialRequest;
use App\Http\Requests\HeroSectionRequest;
use App\Models\Blog;

class HomePagesSectionController extends Controller
{

    public function HeroformShow(){
        $breadcrumb = ['Dashboard' => route('app.dashboard'),'Create'=>''];
        setThisPageTitle('Create');
        $heroSection=frontendSection::where('section_name','hero_section')->first();
        return view('backend.single-pages.hero-section.form',compact('breadcrumb','heroSection'));
    }
    public function heroUpdateOrCreate(HeroSectionRequest $request){
            if ($request->image != null) {
                if ($request->image == true) {
                    $image = $this->file_update($request->file('image'), 'Backend/images/homepages/hero_image/', $request->image_old);
                }
            } else {
                if ($request->hasFile('image')) {
                    $image = $this->file_upload('Backend/images/homepages/hero_image/', $request->file('image'));
                } else {
                    $image = $request->image_old;
                }
            }

        $social_share=[];
        foreach($request->social_share as $value){
            $social_share[]=$value;
        };

        $data=[
            'hello_text'         => $request->hello_text,
            'title'              => $request->title,
            'designation'        => $request->designation,
            'hire_button_target' => $request->hire_button_target,
            'hire_button_url'    => $request->hire_button_url,
            'hire_button_text'   => $request->hire_button_text,
            'cv_button_target'   => $request->cv_button_target,
            'cv_button_url'      => $request->cv_button_url,
            'cv_button_text'     => $request->cv_button_text,
            'social_share'       => json_encode($social_share),
            'image'              => $image,

        ];

        frontendSection::updateOrCreate(['section_name'=>$request->section_name],[
            'section_name' => 'hero_section',
            'data'         => json_encode($data),
            'status'       => $request->status
        ]);

        return redirect()->back()->with('success','updated successfully');
    }

    // Header-widget--------->
    public function counterIndex(){
        $breadcrumb = ['Dashboard' => route('app.dashboard'),'Table'=>''];
        setThisPageTitle('table');
        $counter=frontendSection::where('section_name','counter_section')->get();
        return view('backend.single-pages.counter-section.index',compact('breadcrumb','counter'));
    }
    public function counterCreate(){
        $breadcrumb = ['Dashboard' => route('app.dashboard'),'index'=>route('app.counter.index'),'Create'=>''];
        setThisPageTitle('Create');
        $counter=frontendSection::where('section_name','counter_section')->get();
        return view('backend.single-pages.counter-section.form',compact('breadcrumb','counter'));
    }
    public function counterStore(Request $request){
        $request->validate([
            'number' => 'required',
            'title'  => 'required',
            'status'  => 'required'
        ]);
        $data=[
            'number' => $request->number,
            'title'  => $request->title,
        ];
        frontendSection::create([
            'section_name' => 'counter_section',
            'data'         => json_encode($data),
            'status'       => $request->status
        ]);
        return redirect()->route('app.counter.index')->with('success','Create Successfully');
    }
    public function counterEdit($id){
        $breadcrumb = ['Dashboard' => route('app.dashboard'),'index'=>route('app.counter.index'),'edit'=>'' ];
        setThisPageTitle('edit');
        $counters=frontendSection::find($id);
        return view('backend.single-pages.counter-section.form',compact('breadcrumb','counters'));
    }
    public function counterUpdate(Request $request,$id){
        $counters=frontendSection::find($id);
        $request->validate([
            'number' => 'required',
            'title'  => 'required',
            'status'  => 'required'
        ]);
        $data=[
            'number' => $request->number,
            'title'  => $request->title,
        ];
        $counters->update([
            'section_name' => 'counter_section',
            'data'         => json_encode($data),
            'status'       => $request->status
        ]);
        return redirect(route('app.counter.index'))->with('success','Create Successfully');
    }
    public function counterDelete($id){
        $counters=frontendSection::find($id);
        $counters->delete();
        return redirect()->back()->with('success','Delete successfully');
    }
    // about-widget--------->
    public function aboutformShow(){
        $breadcrumb = ['Dashboard' => route('app.dashboard'),'Create'=>''];
        setThisPageTitle('Create');
        $aboutSection=frontendSection::where('section_name','about_section')->first();
        return view('backend.single-pages.about-section.form',compact('breadcrumb','aboutSection'));
    }
    public function aboutUpdateOrCreate(aboutSectionReqest $request){
        if ($request->image != null) {
            if ($request->image ==true) {
                $image = $this->file_update($request->file('image'), 'Backend/images/homepages/about_image/', $request->image_old);
            }
        } else {
            if ($request->hasFile('image')) {
                $image = $this->file_upload('Backend/images/homepages/about_image/', $request->file('image'));
            } else {
                $image = $request->image_old;
            }
        }
        $data=[
            'title'         => $request->title,
            'sub_title'     => $request->sub_title,
            'description'   => $request->description,
            'button_text'   => $request->button_text,
            'button_target' => $request->button_target,
            'button_url'    => $request->button_url,
            'image'         => $image,
        ];
        frontendSection::updateOrCreate(['section_name'=>$request->section_name],[
            'section_name' => 'about_section',
            'data'         => json_encode($data),
            'status'       => $request->status
        ]);
        return redirect()->back()->with('success','Update successfully');
    }
    //service --------------->
    public function serviceIndex(){
        $breadcrumb = ['Dashboard' => route('app.dashboard'),'Table'=>''];
        setThisPageTitle('table');
        $service=frontendSection::where('section_name','service_section')->get();
        return view('backend.single-pages.service-section.index',compact('breadcrumb','service'));
    }
    public function serviceCreate(){
        $breadcrumb = ['Dashboard' => route('app.dashboard'),'index'=>route('app.service.index'),'Create'=>''];
        setThisPageTitle('Create');
        $service=frontendSection::where('section_name','service_section')->get();
        return view('backend.single-pages.service-section.form',compact('breadcrumb','service'));
    }
    public function serviceStore(Request $request){
        $request->validate([
            'service_icon' => 'required',
            'title'  => 'required',
            'status'  => 'required'
        ]);
        $data=[
            'service_icon' => $request->service_icon,
            'title'        => $request->title,
        ];
        frontendSection::create([
            'section_name' => 'service_section',
            'data'         => json_encode($data),
            'status'       => $request->status
        ]);
        return redirect(route('app.service.index'))->with('success','Create Successfully');
    }
    public function serviceEdit($id){
        $breadcrumb = ['Dashboard' => route('app.dashboard'),'index'=>route('app.service.index'),'edit'=>'' ];
        setThisPageTitle('edit');
        $services=frontendSection::find($id);
        return view('backend.single-pages.service-section.form',compact('breadcrumb','services'));
    }
    public function serviceUpdate(Request $request,$id){
        $services=frontendSection::find($id);
        $request->validate([
            'service_icon' => 'required',
            'title'        => 'required',
            'status'       => 'required'
        ]);
        $data=[
            'service_icon' => $request->service_icon,
            'title'        => $request->title,
        ];
        $services->update([
            'section_name' => 'service_section',
            'data'         => json_encode($data),
            'status'       => $request->status
        ]);
        return redirect(route('app.service.index'))->with('success','Create Successfully');
    }
    public function serviceDelete($id){
        $services=frontendSection::find($id);
        $services->delete();
        return redirect()->back()->with('success','Delete successfully');
    }

    //choose=-------------->
    public function chooseIndex(){
        $breadcrumb = ['Dashboard' => route('app.dashboard'),'Table'=>''];
        setThisPageTitle('table');
        $choose=frontendSection::where('section_name','choose_section')->get();
        return view('backend.single-pages.choose-section.index',compact('breadcrumb','choose'));
    }
    public function chooseCreate(){
        $breadcrumb = ['Dashboard' => route('app.dashboard'),'index'=>route('app.choose.index'),'Create'=>''];
        setThisPageTitle('Create');
        $choose=frontendSection::where('section_name','choose_section')->get();
        return view('backend.single-pages.choose-section.form',compact('breadcrumb','choose'));
    }
    public function chooseStore(Request $request){
        $request->validate([
            'number' => 'required',
            'title'  => 'required',
            'status'  => 'required'
        ]);
        $data=[
            'number' => $request->number,
            'title'  => $request->title,
        ];
        frontendSection::create([
            'section_name' => 'choose_section',
            'data'         => json_encode($data),
            'status'       => $request->status
        ]);
        return redirect(route('app.choose.index'))->with('success','Create Successfully');
    }
    public function chooseEdit($id){
        $breadcrumb = ['Dashboard' => route('app.dashboard'),'index'=>route('app.choose.index'),'edit'=>'' ];
        setThisPageTitle('edit');
        $chooses=frontendSection::find($id);
        return view('backend.single-pages.choose-section.form',compact('breadcrumb','chooses'));
    }
    public function chooseUpdate(Request $request,$id){
        $chooses=frontendSection::find($id);
        $request->validate([
            'number' => 'required',
            'title'  => 'required',
            'status'  => 'required'
        ]);
        $data=[
            'number' => $request->number,
            'title'  => $request->title,
        ];
        $chooses->update([
            'section_name' => 'choose_section',
            'data'         => json_encode($data),
            'status'       => $request->status
        ]);
        return redirect(route('app.choose.index'))->with('success','Create Successfully');
    }
    public function chooseDelete($id){
        $chooses=frontendSection::find($id);
        $chooses->delete();
        return redirect()->back()->with('success','Delete successfully');
    }

    //Testmonial=-------------->
    public function testmonialIndex(){
        $breadcrumb = ['Dashboard' => route('app.dashboard'),'Table'=>''];
        setThisPageTitle('table');
        $testmonial=frontendSection::where('section_name','testmonial_section')->get();
        return view('backend.single-pages.testmonial-section.index',compact('breadcrumb','testmonial'));
    }
    public function testmonialCreate(){
        $breadcrumb = ['Dashboard' => route('app.dashboard'),'index'=>route('app.testmonial.index'),'Create'=>''];
        setThisPageTitle('Create');
        $testmonial=frontendSection::where('section_name','testmonial_section')->get();
        return view('backend.single-pages.testmonial-section.form',compact('breadcrumb','testmonial'));
    }
    public function testmonialStore(testmonialRequest $request){
        if($request->hasFile('image')){
            $image=$this->file_upload('Backend/images/homepages/testmonial_image',$request->image);
        };

        $data=[
            'testmonial_name' => $request->testmonial_name,
            'designation'     => $request->designation,
            'description'     => $request->description,
            'image'           => $image,
        ];
        frontendSection::create([
            'section_name' => 'testmonial_section',
            'data'         => json_encode($data),
            'status'       => $request->status
        ]);
        return redirect(route('app.testmonial.index'))->with('success','Create Successfully');
    }
    public function testmonialEdit($id){
        $breadcrumb = ['Dashboard' => route('app.dashboard'),'index'=>route('app.testmonial.index'),'edit'=>'' ];
        setThisPageTitle('edit');
        $testmonials=frontendSection::find($id);
        return view('backend.single-pages.testmonial-section.form',compact('breadcrumb','testmonials'));
    }
    public function testmonialUpdate(Request $request,$id){
        $testmonials=frontendSection::find($id);
        if($testmonials !=null){
            $update_data=json_decode($testmonials->data);
        }
        if($request->hasFile('image')){
            $image=$this->file_update($request->image,'Backend/images/homepages/testmonial_image/',$update_data->image);
        }else{
            $image=$request->image_old;
        };
        $data=[
            'testmonial_name' => $request->testmonial_name,
            'designation'     => $request->designation,
            'description'     => $request->description,
            'image'           => $image,
        ];
        $testmonials->update([
            'section_name' => 'testmonial_section',
            'data'         => json_encode($data),
            'status'       => $request->status
        ]);
        return redirect(route('app.testmonial.index'))->with('success','Create Successfully');
    }
    public function testmonialDelete($id){
        $testmonials=frontendSection::find($id);
        $data=json_decode($testmonials->data);
        $this->file_remove('Backend/images/homepages/testmonial_image/',$data->image_old);
        $testmonials->delete();
        return redirect()->back()->with('success','Delete successfully');
    }

    //portfolio=-------------->
    public function portfolioIndex(){
        $breadcrumb = ['Dashboard' => route('app.dashboard'),'Table'=>''];
        setThisPageTitle('table');
        $portfolio=frontendSection::where('section_name','portfolio_section')->get();
        return view('backend.single-pages.portfolio-section.index',compact('breadcrumb','portfolio'));
    }
    public function portfolioCreate(){
        $breadcrumb = ['Dashboard' => route('app.dashboard'),'index'=>route('app.portfolio.index'),'Create'=>''];
        setThisPageTitle('Create');
        $portfolio=frontendSection::where('section_name','portfolio_section')->get();
        return view('backend.single-pages.portfolio-section.form',compact('breadcrumb','portfolio'));
    }
    public function portfolioStore(portfolioRequest $request){
        if($request->hasFile('image')){
            $image=$this->file_upload('Backend/images/homepages/portfolio_image',$request->image);
        };

        $data=[
            'title'    => $request->title,
            'site_url' => $request->site_url,
            'image'    => $image,
        ];
        frontendSection::create([
            'section_name' => 'portfolio_section',
            'data'         => json_encode($data),
            'status'       => $request->status
        ]);
        return redirect(route('app.portfolio.index'))->with('success','Create Successfully');
    }
    public function portfolioEdit($id){
        $breadcrumb = ['Dashboard' => route('app.dashboard'),'index'=>route('app.portfolio.index'),'edit'=>'' ];
        setThisPageTitle('edit');
        $portfolios=frontendSection::find($id);
        return view('backend.single-pages.portfolio-section.form',compact('breadcrumb','portfolios'));
    }
    public function portfolioUpdate(Request $request,$id){
        $portfolios=frontendSection::find($id);
        if($portfolios !=null){
            $update_data=json_decode($portfolios->data);
        }
        if($request->hasFile('image')){
            $image=$this->file_update($request->image,'Backend/images/homepages/portfolio_image/',$update_data->image);
        }else{
            $image=$request->image_old;
        };
        $data=[
            'title'    => $request->title,
            'site_url' => $request->site_url,
            'image'    => $image,
        ];
        $portfolios->update([
            'section_name' => 'portfolio_section',
            'data'         => json_encode($data),
            'status'       => $request->status
        ]);
        return redirect(route('app.portfolio.index'))->with('success','Create Successfully');
    }
    public function portfolioDelete($id){
        $portfolios=frontendSection::find($id);
        $data=json_decode($portfolios->data);
        $this->file_remove('Backend/images/homepages/portfolio_image/',$data->image);
        $portfolios->delete();
        return redirect()->back()->with('success','Delete successfully');
    }
    //Blogs=-------------->
    public function blogIndex(){
        $breadcrumb = ['Dashboard' => route('app.dashboard'),'Table'=>''];
        setThisPageTitle('table');
        $blog=Blog::with('category')->orderBy('id','ASC')->get();
        return view('backend.single-pages.blog-section.index',compact('breadcrumb','blog'));
    }
    public function blogCreate(){
        $categories=Category::all();
        $breadcrumb = ['Dashboard' => route('app.dashboard'),'index'=>route('app.blog.index'),'Create'=>''];
        setThisPageTitle('Create');
        // $blog=Blog::where('section_name','blog_section')->get();
        return view('backend.single-pages.blog-section.form',compact('breadcrumb','categories'));
    }
    public function blogStore(blogSectionReqest $request){
        if($request->hasFile('image')){
            $image=$this->file_upload('Backend/images/homepages/blog_image',$request->image);
        };

        // $categoryID = serialize([$request->category]);
        Blog::create([
            'category_id'   => json_encode($request->category),
            'title'         => $request->title,
            'description'   => $request->description,
            'likes'         => $request->likes,
            'comments'      => $request->comments,
            'button_url'    => $request->button_url,
            'button_text'   => $request->button_text,
            'button_target' => $request->button_target,
            'image'         => $image,
            'status'        => $request->status
        ]);
        
        return redirect(route('app.blog.index'))->with('success','Create Successfully');
    }
    public function blogEdit($id){
        $breadcrumb = ['Dashboard' => route('app.dashboard'),'index'=>route('app.blog.index'),'edit'=>'' ];
        setThisPageTitle('edit');
        $blogs=Blog::find($id);
        $categories=Category::all();
        return view('backend.single-pages.blog-section.form',compact('breadcrumb','blogs','categories'));
    }
    public function blogUpdate(blogSectionReqest $request,$id){
        $blogs_image=Blog::find($id);
        if($request->hasFile('image')){
            $image=$this->file_update($request->image,'Backend/images/homepages/blog_image/',$blogs_image->image);
        }else{
            $image=$request->image_old;
        };
        
        $blogs_image->update([
            'section_name'  => 'blog_section',
            'category_id'   => json_encode($request->category),
            'title'         => $request->title,
            'description'   => $request->description,
            'likes'         => $request->likes,
            'comments'      => $request->comments,
            'button_url'    => $request->button_url,
            'button_text'   => $request->button_text,
            'button_target' => $request->button_target,
            'image'         => $image,
            'status'        => $request->status
        ]);
        return redirect(route('app.blog.index'))->with('success','Create Successfully');
    }
    public function blogDelete($id){
        $blogs=Blog::find($id);
        if($blogs !=null){
            $data=json_decode($blogs->data);
        }
        $this->file_remove('Backend/images/homepages/blog_image/',$data->image);
        $blogs->delete();
        return redirect()->back()->with('success','Delete successfully');
    }
    // hereme-widget--------->
    public function hiremeformShow(){
        $breadcrumb = ['Dashboard' => route('app.dashboard'),'Create'=>''];
        setThisPageTitle('Create');
        $hiremeSection=frontendSection::where('section_name','hireme_section')->first();
        return view('backend.single-pages.hireme-section.form',compact('breadcrumb','hiremeSection'));
    }
    public function hiremeUpdateOrCreate(Request $request){
        $request->validate([
            'title'       => 'required',
            'description' => 'required',
            'status'      => 'required',
        ]);
        $data=[
            'title'         => $request->title,
            'description'   => $request->description,
            'button_text'   => $request->button_text,
            'button_target' => $request->button_target,
            'button_url'    => $request->button_url,
        ];
        frontendSection::updateOrCreate(['section_name'=>$request->section_name],[
            'section_name' => 'hireme_section',
            'data'         => json_encode($data),
            'status'       => $request->status
        ]);
        return redirect()->back()->with('success','Update successfully');
    }
    //contact form create
    public function contactIndex(){
        $breadcrumb = ['Dashboard' => route('app.dashboard'),'index'=>''];
        setThisPageTitle('Index');
        $contactmail=frontendSection::where('section_name','contact_form')->get();
        return view('backend.single-pages.contact-form.index',compact('breadcrumb','contactmail'));
    }
    public function contactCreate(Request $request){
        $request->validate([
            'your_email'       => 'required',
        ]);
        $data=[
            'your_email'         => $request->your_email,
        ];
        frontendSection::updateOrCreate([
            'section_name' => 'contact_form',
            'data'         => json_encode($data),
        ]);
        return redirect()->back()->with('success','Contact Form Update successfully');
    }
    public function contactDelete($id){
        $contactmail=frontendSection::find($id);
        $contactmail->delete();
        return redirect()->back()->with('success','Delete successfully');
    }
     // map contact-widget--------->
     public function mapaddressformShow(){
        $breadcrumb = ['Dashboard' => route('app.dashboard'),'Create'=>''];
        setThisPageTitle('Create');
        $mapaddressSection=frontendSection::where('section_name','mapaddress_section')->first();
        return view('backend.single-pages.mapaddress-section.form',compact('breadcrumb','mapaddressSection'));
    }
    public function mapaddressUpdateOrCreate(mapaddressRequest $request){

        $data=[
            'subtitle'       => $request->subtitle,
            'title'          => $request->title,
            'location_title' => $request->location_title,
            'address'        => $request->address,
            'number_title'   => $request->number_title,
            'number'         => $request->number,
            'email_title'    => $request->email_title,
            'email'          => $request->email,
            'map_url'        => $request->map_url,
        ];
        frontendSection::updateOrCreate(['section_name'=>$request->section_name],[
            'section_name' => 'mapaddress_section',
            'data'         => json_encode($data),
            'status'       => $request->status
        ]);
        return redirect()->back()->with('success','Update successfully');
    }
}
