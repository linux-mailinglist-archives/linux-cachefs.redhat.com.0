Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7AC496482
	for <lists+linux-cachefs@lfdr.de>; Fri, 21 Jan 2022 18:52:56 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-tKI1D1OxOBeB8C2HJJzaFw-1; Fri, 21 Jan 2022 12:52:54 -0500
X-MC-Unique: tKI1D1OxOBeB8C2HJJzaFw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 425DB8024F5;
	Fri, 21 Jan 2022 17:52:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 329047A408;
	Fri, 21 Jan 2022 17:52:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 513631809CB8;
	Fri, 21 Jan 2022 17:52:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20LHqhm4005369 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 21 Jan 2022 12:52:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6CDE876ED; Fri, 21 Jan 2022 17:52:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 686137773
	for <linux-cachefs@redhat.com>; Fri, 21 Jan 2022 17:52:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48FAF85A5B9
	for <linux-cachefs@redhat.com>; Fri, 21 Jan 2022 17:52:40 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-115-QKIK656gMk-EjcDY_I2e4Q-1; Fri, 21 Jan 2022 12:52:36 -0500
X-MC-Unique: QKIK656gMk-EjcDY_I2e4Q-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 3FC73CE242D;
	Fri, 21 Jan 2022 17:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01A3AC340E2;
	Fri, 21 Jan 2022 17:52:28 +0000 (UTC)
Message-ID: <49f163f8c073756346f486a916e568e8744f3be0.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com
Date: Fri, 21 Jan 2022 12:52:27 -0500
In-Reply-To: <164251403694.3435901.9797725381831316715.stgit@warthog.procyon.org.uk>
References: <164251396932.3435901.344517748027321142.stgit@warthog.procyon.org.uk>
	<164251403694.3435901.9797725381831316715.stgit@warthog.procyon.org.uk>
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, Dominique,
	Torvalds <torvalds@linux-foundation.org>,
	Martinet <asmadeus@codewreck.org>, linux-fsdevel@vger.kernel.org,
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <smfrench@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	v9fs-developer@lists.sourceforge.net,
	Omar Sandoval <osandov@osandov.com>, Linus,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 04/11] cachefiles: Make some tracepoint
	adjustments
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2022-01-18 at 13:53 +0000, David Howells wrote:
> Make some adjustments to tracepoints to make the tracing a bit more
> followable:
> 
>  (1) Standardise on displaying the backing inode number as "B=<hex>" with
>      no leading zeros.
> 
>  (2) Make the cachefiles_lookup tracepoint log the directory inode number
>      as well as the looked-up inode number.
> 
>  (3) Add a cachefiles_lookup tracepoint into cachefiles_get_directory() to
>      log directory lookup.
> 
>  (4) Add a new cachefiles_mkdir tracepoint and use that to log a successful
>      mkdir from cachefiles_get_directory().
> 
>  (5) Make the cachefiles_unlink and cachefiles_rename tracepoints log the
>      inode number of the affected file/dir rather than dentry struct
>      pointers.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: linux-cachefs@redhat.com
> ---
> 
>  fs/cachefiles/namei.c             |    8 ++--
>  include/trace/events/cachefiles.h |   82 +++++++++++++++++++++++--------------
>  2 files changed, 56 insertions(+), 34 deletions(-)
> 
> diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
> index 9bd692870617..52c9f0864a87 100644
> --- a/fs/cachefiles/namei.c
> +++ b/fs/cachefiles/namei.c
> @@ -101,6 +101,7 @@ struct dentry *cachefiles_get_directory(struct cachefiles_cache *cache,
>  		subdir = lookup_one_len(dirname, dir, strlen(dirname));
>  	else
>  		subdir = ERR_PTR(ret);
> +	trace_cachefiles_lookup(NULL, dir, subdir);
>  	if (IS_ERR(subdir)) {
>  		trace_cachefiles_vfs_error(NULL, d_backing_inode(dir),
>  					   PTR_ERR(subdir),
> @@ -135,6 +136,7 @@ struct dentry *cachefiles_get_directory(struct cachefiles_cache *cache,
>  						   cachefiles_trace_mkdir_error);
>  			goto mkdir_error;
>  		}
> +		trace_cachefiles_mkdir(dir, subdir);
>  
>  		if (unlikely(d_unhashed(subdir))) {
>  			cachefiles_put_directory(subdir);
> @@ -233,7 +235,7 @@ static int cachefiles_unlink(struct cachefiles_cache *cache,
>  	};
>  	int ret;
>  
> -	trace_cachefiles_unlink(object, dentry, why);
> +	trace_cachefiles_unlink(object, d_inode(dentry)->i_ino, why);
>  	ret = security_path_unlink(&path, dentry);
>  	if (ret < 0) {
>  		cachefiles_io_error(cache, "Unlink security error");
> @@ -386,7 +388,7 @@ int cachefiles_bury_object(struct cachefiles_cache *cache,
>  			.new_dir	= d_inode(cache->graveyard),
>  			.new_dentry	= grave,
>  		};
> -		trace_cachefiles_rename(object, rep, grave, why);
> +		trace_cachefiles_rename(object, d_inode(rep)->i_ino, why);
>  		ret = cachefiles_inject_read_error();
>  		if (ret == 0)
>  			ret = vfs_rename(&rd);
> @@ -617,7 +619,7 @@ bool cachefiles_look_up_object(struct cachefiles_object *object)
>  						  object->d_name_len);
>  	else
>  		dentry = ERR_PTR(ret);
> -	trace_cachefiles_lookup(object, dentry);
> +	trace_cachefiles_lookup(object, fan, dentry);
>  	if (IS_ERR(dentry)) {
>  		if (dentry == ERR_PTR(-ENOENT))
>  			goto new_file;
> diff --git a/include/trace/events/cachefiles.h b/include/trace/events/cachefiles.h
> index 1172529b5b49..093c4acb7a3a 100644
> --- a/include/trace/events/cachefiles.h
> +++ b/include/trace/events/cachefiles.h
> @@ -233,25 +233,48 @@ TRACE_EVENT(cachefiles_ref,
>  
>  TRACE_EVENT(cachefiles_lookup,
>  	    TP_PROTO(struct cachefiles_object *obj,
> +		     struct dentry *dir,
>  		     struct dentry *de),
>  
> -	    TP_ARGS(obj, de),
> +	    TP_ARGS(obj, dir, de),
>  
>  	    TP_STRUCT__entry(
>  		    __field(unsigned int,		obj	)
>  		    __field(short,			error	)
> +		    __field(unsigned long,		dino	)
>  		    __field(unsigned long,		ino	)
>  			     ),
>  
>  	    TP_fast_assign(
> -		    __entry->obj	= obj->debug_id;
> +		    __entry->obj	= obj ? obj->debug_id : 0;
> +		    __entry->dino	= d_backing_inode(dir)->i_ino;
>  		    __entry->ino	= (!IS_ERR(de) && d_backing_inode(de) ?
>  					   d_backing_inode(de)->i_ino : 0);
>  		    __entry->error	= IS_ERR(de) ? PTR_ERR(de) : 0;
>  			   ),
>  
> -	    TP_printk("o=%08x i=%lx e=%d",
> -		      __entry->obj, __entry->ino, __entry->error)
> +	    TP_printk("o=%08x dB=%lx B=%lx e=%d",
> +		      __entry->obj, __entry->dino, __entry->ino, __entry->error)
> +	    );
> +
> +TRACE_EVENT(cachefiles_mkdir,
> +	    TP_PROTO(struct dentry *dir, struct dentry *subdir),
> +
> +	    TP_ARGS(dir, subdir),
> +
> +	    TP_STRUCT__entry(
> +		    __field(unsigned int,			dir	)
> +		    __field(unsigned int,			subdir	)
> +			     ),
> +
> +	    TP_fast_assign(
> +		    __entry->dir	= d_backing_inode(dir)->i_ino;
> +		    __entry->subdir	= d_backing_inode(subdir)->i_ino;
> +			   ),
> +
> +	    TP_printk("dB=%x sB=%x",
> +		      __entry->dir,
> +		      __entry->subdir)
>  	    );
>  
>  TRACE_EVENT(cachefiles_tmpfile,
> @@ -269,7 +292,7 @@ TRACE_EVENT(cachefiles_tmpfile,
>  		    __entry->backer	= backer->i_ino;
>  			   ),
>  
> -	    TP_printk("o=%08x b=%08x",
> +	    TP_printk("o=%08x B=%x",
>  		      __entry->obj,
>  		      __entry->backer)
>  	    );
> @@ -289,61 +312,58 @@ TRACE_EVENT(cachefiles_link,
>  		    __entry->backer	= backer->i_ino;
>  			   ),
>  
> -	    TP_printk("o=%08x b=%08x",
> +	    TP_printk("o=%08x B=%x",
>  		      __entry->obj,
>  		      __entry->backer)
>  	    );
>  
>  TRACE_EVENT(cachefiles_unlink,
>  	    TP_PROTO(struct cachefiles_object *obj,
> -		     struct dentry *de,
> +		     ino_t ino,
>  		     enum fscache_why_object_killed why),
>  
> -	    TP_ARGS(obj, de, why),
> +	    TP_ARGS(obj, ino, why),
>  
>  	    /* Note that obj may be NULL */
>  	    TP_STRUCT__entry(
>  		    __field(unsigned int,		obj		)
> -		    __field(struct dentry *,		de		)
> +		    __field(unsigned int,		ino		)
>  		    __field(enum fscache_why_object_killed, why		)
>  			     ),
>  
>  	    TP_fast_assign(
>  		    __entry->obj	= obj ? obj->debug_id : UINT_MAX;
> -		    __entry->de		= de;
> +		    __entry->ino	= ino;
>  		    __entry->why	= why;
>  			   ),
>  
> -	    TP_printk("o=%08x d=%p w=%s",
> -		      __entry->obj, __entry->de,
> +	    TP_printk("o=%08x B=%x w=%s",
> +		      __entry->obj, __entry->ino,
>  		      __print_symbolic(__entry->why, cachefiles_obj_kill_traces))
>  	    );
>  
>  TRACE_EVENT(cachefiles_rename,
>  	    TP_PROTO(struct cachefiles_object *obj,
> -		     struct dentry *de,
> -		     struct dentry *to,
> +		     ino_t ino,
>  		     enum fscache_why_object_killed why),
>  
> -	    TP_ARGS(obj, de, to, why),
> +	    TP_ARGS(obj, ino, why),
>  
>  	    /* Note that obj may be NULL */
>  	    TP_STRUCT__entry(
>  		    __field(unsigned int,		obj		)
> -		    __field(struct dentry *,		de		)
> -		    __field(struct dentry *,		to		)
> +		    __field(unsigned int,		ino		)
>  		    __field(enum fscache_why_object_killed, why		)
>  			     ),
>  
>  	    TP_fast_assign(
>  		    __entry->obj	= obj ? obj->debug_id : UINT_MAX;
> -		    __entry->de		= de;
> -		    __entry->to		= to;
> +		    __entry->ino	= ino;
>  		    __entry->why	= why;
>  			   ),
>  
> -	    TP_printk("o=%08x d=%p t=%p w=%s",
> -		      __entry->obj, __entry->de, __entry->to,
> +	    TP_printk("o=%08x B=%x w=%s",
> +		      __entry->obj, __entry->ino,
>  		      __print_symbolic(__entry->why, cachefiles_obj_kill_traces))
>  	    );
>  
> @@ -370,7 +390,7 @@ TRACE_EVENT(cachefiles_coherency,
>  		    __entry->ino	= ino;
>  			   ),
>  
> -	    TP_printk("o=%08x %s i=%llx c=%u",
> +	    TP_printk("o=%08x %s B=%llx c=%u",
>  		      __entry->obj,
>  		      __print_symbolic(__entry->why, cachefiles_coherency_traces),
>  		      __entry->ino,
> @@ -397,7 +417,7 @@ TRACE_EVENT(cachefiles_vol_coherency,
>  		    __entry->ino	= ino;
>  			   ),
>  
> -	    TP_printk("V=%08x %s i=%llx",
> +	    TP_printk("V=%08x %s B=%llx",
>  		      __entry->vol,
>  		      __print_symbolic(__entry->why, cachefiles_coherency_traces),
>  		      __entry->ino)
> @@ -435,7 +455,7 @@ TRACE_EVENT(cachefiles_prep_read,
>  		    __entry->cache_inode = cache_inode;
>  			   ),
>  
> -	    TP_printk("R=%08x[%u] %s %s f=%02x s=%llx %zx ni=%x b=%x",
> +	    TP_printk("R=%08x[%u] %s %s f=%02x s=%llx %zx ni=%x B=%x",
>  		      __entry->rreq, __entry->index,
>  		      __print_symbolic(__entry->source, netfs_sreq_sources),
>  		      __print_symbolic(__entry->why, cachefiles_prepare_read_traces),
> @@ -466,7 +486,7 @@ TRACE_EVENT(cachefiles_read,
>  		    __entry->len	= len;
>  			   ),
>  
> -	    TP_printk("o=%08x b=%08x s=%llx l=%zx",
> +	    TP_printk("o=%08x B=%x s=%llx l=%zx",
>  		      __entry->obj,
>  		      __entry->backer,
>  		      __entry->start,
> @@ -495,7 +515,7 @@ TRACE_EVENT(cachefiles_write,
>  		    __entry->len	= len;
>  			   ),
>  
> -	    TP_printk("o=%08x b=%08x s=%llx l=%zx",
> +	    TP_printk("o=%08x B=%x s=%llx l=%zx",
>  		      __entry->obj,
>  		      __entry->backer,
>  		      __entry->start,
> @@ -524,7 +544,7 @@ TRACE_EVENT(cachefiles_trunc,
>  		    __entry->why	= why;
>  			   ),
>  
> -	    TP_printk("o=%08x b=%08x %s l=%llx->%llx",
> +	    TP_printk("o=%08x B=%x %s l=%llx->%llx",
>  		      __entry->obj,
>  		      __entry->backer,
>  		      __print_symbolic(__entry->why, cachefiles_trunc_traces),
> @@ -549,7 +569,7 @@ TRACE_EVENT(cachefiles_mark_active,
>  		    __entry->inode	= inode->i_ino;
>  			   ),
>  
> -	    TP_printk("o=%08x i=%lx",
> +	    TP_printk("o=%08x B=%lx",
>  		      __entry->obj, __entry->inode)
>  	    );
>  
> @@ -570,7 +590,7 @@ TRACE_EVENT(cachefiles_mark_inactive,
>  		    __entry->inode	= inode->i_ino;
>  			   ),
>  
> -	    TP_printk("o=%08x i=%lx",
> +	    TP_printk("o=%08x B=%lx",
>  		      __entry->obj, __entry->inode)
>  	    );
>  
> @@ -594,7 +614,7 @@ TRACE_EVENT(cachefiles_vfs_error,
>  		    __entry->where	= where;
>  			   ),
>  
> -	    TP_printk("o=%08x b=%08x %s e=%d",
> +	    TP_printk("o=%08x B=%x %s e=%d",
>  		      __entry->obj,
>  		      __entry->backer,
>  		      __print_symbolic(__entry->where, cachefiles_error_traces),
> @@ -621,7 +641,7 @@ TRACE_EVENT(cachefiles_io_error,
>  		    __entry->where	= where;
>  			   ),
>  
> -	    TP_printk("o=%08x b=%08x %s e=%d",
> +	    TP_printk("o=%08x B=%x %s e=%d",
>  		      __entry->obj,
>  		      __entry->backer,
>  		      __print_symbolic(__entry->where, cachefiles_error_traces),
> 
> 

Reviewed-by: Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

