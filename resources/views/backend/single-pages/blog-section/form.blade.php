@extends('layouts.backend.index')
@section('title',$title)
@push('styles')
    <link rel="stylesheet" href="{{ asset('backend/assets/css/demo/image-style.css') }}">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
@endpush
@section('content')
    <div class="row">
        @include('backend.alert_message.alert')
        <div class="col-md-12">
            <div class="card-header form-header">
                <h4 class="card-title text-center">Blog</h4>
            </div>
            <div class="bg-white px-4 py-3 mb-3 shadow-sm rounded">
                <form action="{{ isset($blogs) ? route('app.blog.update',$blogs->id) : route('app.blog.store') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    @isset($blogs)
                        @method('PATCH')
                        <input hidden name="update_id" value="{{ $blogs->id }}">
                    @endisset
                    @isset($blogs)
                        @php
                            $getCategory=json_decode($blogs->category_id);
                        @endphp
                    @endisset
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="form-label" class="required">Category</label>
                                <select name="category[]" class="js-select2 form-control" multiple="multiple">
                                        @foreach ($categories as $category)
                                            <option value="{{ $category->id }}" @isset($blogs)
                                                {{ in_array($category->id,$getCategory) ? 'selected' : '' }}
                                            @endisset>{{ $category->category_name }}</option>
                                        @endforeach
                                </select>
                                <div>
                                    @error('site_url')
                                        <span class="text-danger">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="form-label" class="required">Title</label>
                                <input class="form-control" type="text" name="title" placeholder="title" value="{{ $blogs->title ?? '' }}">
                                <div>
                                    @error('title')
                                        <span class="text-danger">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="form-label" class="required">Description</label>
                                <textarea class="form-control" id="description_note" name="description" rows="4">{{ $blogs->description ?? '' }}</textarea>
                                <div>
                                    @error('description')
                                        <span class="text-danger">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="form-label">Like</label>
                                <input class="form-control" type="text" name="likes" placeholder="likes" value="{{ $blogs->likes ?? '' }}">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="form-label">Comments</label>
                                <input class="form-control" type="text" name="comments" placeholder="comments" value="{{ $blogs->comments ?? '' }}">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="form-label">Button Url</label>
                                <input class="form-control" type="text" name="button_url" placeholder="button url" value="{{ $blogs->button_url ?? '' }}">
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="form-label" >Button Text</label>
                                <input class="form-control" type="text" name="button_text" placeholder="button text" value="{{ $blogs->button_text ?? '' }}">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="form-label">Button target</label>
                                <select name="button_target" class="form-control">
                                    <option value="">Select Target</option>
                                    <option value="_blank" @isset($blogs)
                                        {{ $blogs->button_target == "_blank" ? 'selected' : '' }}
                                    @endisset>New Tab</option>
                                    <option value="_self" @isset($blogs)
                                    {{ $blogs->button_target == "_self" ? 'selected' : '' }}
                                @endisset>Current Tab</option>
                                </select>

                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="form-label" class="required">Image</label>
                                <input type="file" name="image" class="form-control">
                                <div>
                                    @error('image')
                                        <span class="text-danger">{{ $message }}</span>
                                    @enderror
                                </div>
                                @isset($blogs)
                                <img style="width: 60px; height: 60px;" src="{{ asset('Backend/images/homepages/blog_image/'.$blogs->image) }}" alt="{{ $blogs->title ?? '' }}">
                                <input type="hidden" name="image_old" id="image_old" value="{{ asset('Backend/images/homepages/blog_image/'.$blogs->image) }}">
                                @endisset
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="form-label" class="required">Status</label>
                                <select name="status" class="form-control">
                                    <option value="">Select status</option>
                                    <option value="1" @isset($blogs)
                                        {{ $blogs->status == 1 ? 'selected' : '' }}
                                    @endisset>publish</option>
                                    <option value="2" @isset($blogs)
                                    {{ $blogs->status == 2 ? 'selected' : '' }}
                                @endisset>pending</option>
                                </select>
                                <div>
                                    @error('status')
                                        <span class="text-danger">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 text-right">
                           <button type="submit" class="btn btn-lg btn-primary">Update</button>
                        </div>

                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection
@push('scripts')
<script>
    $(document).ready(function() {
        $('#description_note*').summernote({
            height:200
        });
    });

</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
    <script>
        $(document).ready(function() {
            $(".js-select2").select2({
                closeOnSelect: false,
                placeholder: "Choose Socal Media !",
                allowClear: true,
                tags: true
            });
        });
    </script>
@endpush
