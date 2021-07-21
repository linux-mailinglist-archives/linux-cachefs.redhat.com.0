Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DA51B3D1553
	for <lists+linux-cachefs@lfdr.de>; Wed, 21 Jul 2021 19:44:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626889443;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nKb2jSlJNGFv0zz6Con5CyfX4WgKLgi3OV9FLEE1zBA=;
	b=QGXemeS9P5RjsGbmP9yT4whYnxdkt3Dv8ZI9vmwDLWZERRrABE/RKL2jM0EmEPY0rUk/vu
	6N/sa8KhL4kN6gNqMvWks9YaE/XXr9QMtCtzhZv8m39zJE9frtvN9RliL04O1Gob5PnmQf
	veC23HAuW54V7haE8dJZ3qZNzeTVx38=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-s3FqgUrgN9SjXV0-s548Uw-1; Wed, 21 Jul 2021 13:44:02 -0400
X-MC-Unique: s3FqgUrgN9SjXV0-s548Uw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C3B1192CC40;
	Wed, 21 Jul 2021 17:43:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ABF5F5D9DD;
	Wed, 21 Jul 2021 17:43:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0F6641801028;
	Wed, 21 Jul 2021 17:43:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16LHhsAY002844 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 21 Jul 2021 13:43:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 72A95FC756; Wed, 21 Jul 2021 17:43:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D0D9FDCC5
	for <linux-cachefs@redhat.com>; Wed, 21 Jul 2021 17:43:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 460068007B1
	for <linux-cachefs@redhat.com>; Wed, 21 Jul 2021 17:43:50 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
	[209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-157-G-Vu5RAVPxy2lL1UQszz7Q-1; Wed, 21 Jul 2021 13:43:48 -0400
X-MC-Unique: G-Vu5RAVPxy2lL1UQszz7Q-1
Received: by mail-qt1-f198.google.com with SMTP id
	j15-20020ac84c8f0000b0290257b7db4a28so2000111qtv.9
	for <linux-cachefs@redhat.com>; Wed, 21 Jul 2021 10:43:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=3dOn7+nrEQrDF2IcT4kr/9MG9FoA4OKzs2zFSvE50Nw=;
	b=ATimev6MrqG7KdGyzBaMFVnooOYNAxbPhLeTzfeF9zAbp22R2BnRJ6285+xxaeS9G7
	5zoPDd78lWiupayI5PsWsleJU6HydbeDpUGd/JOh2/PYDkG7TnBIi2RR9o2jySzaL4M5
	tnnuNxWaSi8A+1BCfr2rWXssTT44xVCIv1nNplBwrkXZj3lZMIR3t6qOmpLnXR7yuU/x
	vREdCOykBngMXmVIDN/qw+xOubwaQnAomH0DExEPQRJmjnm7OatYNMghE/R/GXtAxOic
	gtsItMuq71ZUAriw1hULl9pBkVJq0O3z7aMseNRzFLUPIb952h/tHSUSUM1vAovomAr4
	TCOQ==
X-Gm-Message-State: AOAM532SjeylutDPpSwBcUooqAVRgOeI0IJY/K2Xe50NsgDq8KXii3UG
	09wfeNT4YgmUVzfnXJzGhkxpsYnwMHHwJlEZ2YIINBBYew6bbl+WlJCOUO5gB7Y+Od2VOjEC80n
	56pduxS01l9ATRNmqLEodaA==
X-Received: by 2002:a05:622a:1653:: with SMTP id
	y19mr18163568qtj.305.1626889428565; 
	Wed, 21 Jul 2021 10:43:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy73QoeXgeoF1lBpX1Vc7kQ/yjCgrGxg1ygCZQ38G6t9sqd8L74fPzeKuZd3aAUpkrFW+V2/g==
X-Received: by 2002:a05:622a:1653:: with SMTP id
	y19mr18163539qtj.305.1626889428351; 
	Wed, 21 Jul 2021 10:43:48 -0700 (PDT)
Received: from [192.168.1.3] (68-20-15-154.lightspeed.rlghnc.sbcglobal.net.
	[68.20.15.154]) by smtp.gmail.com with ESMTPSA id
	r16sm11484664qke.73.2021.07.21.10.43.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 21 Jul 2021 10:43:47 -0700 (PDT)
Message-ID: <e7a3b850e8a42845f4e020c7642743b3dce2b9f1.camel@redhat.com>
From: Jeff Layton <jlayton@redhat.com>
To: David Howells <dhowells@redhat.com>, linux-fsdevel@vger.kernel.org
Date: Wed, 21 Jul 2021 13:43:47 -0400
In-Reply-To: <162687511125.276387.15493860267582539643.stgit@warthog.procyon.org.uk>
References: <162687506932.276387.14456718890524355509.stgit@warthog.procyon.org.uk>
	<162687511125.276387.15493860267582539643.stgit@warthog.procyon.org.uk>
User-Agent: Evolution 3.40.3 (3.40.3-1.fc34)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-nfs@vger.kernel.org,
	Dominique, Miklos Szeredi <miklos@szeredi.hu>,
	Torvalds <torvalds@linux-foundation.org>,
	Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	v9fs-developer@lists.sourceforge.net, linux-cifs@vger.kernel.org,
	ceph-devel@vger.kernel.org, Linus,
	Anna Schumaker <anna.schumaker@netapp.com>,
	devel@lists.orangefs.org, Mike Marshall <hubcap@omnibond.com>
Subject: Re: [Linux-cachefs] [RFC PATCH 03/12] netfs: Remove
 netfs_read_subrequest::transferred
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

On Wed, 2021-07-21 at 14:45 +0100, David Howells wrote:
> Remove netfs_read_subrequest::transferred as it's redundant as the count on
> the iterator added to the subrequest can be used instead.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> ---
> 
>  fs/afs/file.c                |    4 ++--
>  fs/netfs/read_helper.c       |   26 ++++----------------------
>  include/linux/netfs.h        |    1 -
>  include/trace/events/netfs.h |   12 ++++++------
>  4 files changed, 12 insertions(+), 31 deletions(-)
> 
> diff --git a/fs/afs/file.c b/fs/afs/file.c
> index ca529f23515a..82e945dbe379 100644
> --- a/fs/afs/file.c
> +++ b/fs/afs/file.c
> @@ -315,8 +315,8 @@ static void afs_req_issue_op(struct netfs_read_subrequest *subreq)
>  		return netfs_subreq_terminated(subreq, -ENOMEM, false);
>  
>  	fsreq->subreq	= subreq;
> -	fsreq->pos	= subreq->start + subreq->transferred;
> -	fsreq->len	= subreq->len   - subreq->transferred;
> +	fsreq->pos	= subreq->start + subreq->len - iov_iter_count(&subreq->iter);
> +	fsreq->len	= iov_iter_count(&subreq->iter);
>  	fsreq->key	= subreq->rreq->netfs_priv;
>  	fsreq->vnode	= vnode;
>  	fsreq->iter	= &subreq->iter;
> diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
> index 715f3e9c380d..5e1a9be48130 100644
> --- a/fs/netfs/read_helper.c
> +++ b/fs/netfs/read_helper.c
> @@ -148,12 +148,7 @@ static void __netfs_put_subrequest(struct netfs_read_subrequest *subreq,
>   */
>  static void netfs_clear_unread(struct netfs_read_subrequest *subreq)
>  {
> -	struct iov_iter iter;
> -
> -	iov_iter_xarray(&iter, READ, &subreq->rreq->mapping->i_pages,
> -			subreq->start + subreq->transferred,
> -			subreq->len   - subreq->transferred);
> -	iov_iter_zero(iov_iter_count(&iter), &iter);
> +	iov_iter_zero(iov_iter_count(&subreq->iter), &subreq->iter);
>  }
>  
>  static void netfs_cache_read_terminated(void *priv, ssize_t transferred_or_error,
> @@ -173,14 +168,9 @@ static void netfs_read_from_cache(struct netfs_read_request *rreq,
>  				  bool seek_data)
>  {
>  	struct netfs_cache_resources *cres = &rreq->cache_resources;
> -	struct iov_iter iter;
>  
>  	netfs_stat(&netfs_n_rh_read);
> -	iov_iter_xarray(&iter, READ, &rreq->mapping->i_pages,
> -			subreq->start + subreq->transferred,
> -			subreq->len   - subreq->transferred);
> -
> -	cres->ops->read(cres, subreq->start, &iter, seek_data,
> +	cres->ops->read(cres, subreq->start, &subreq->iter, seek_data,
>  			netfs_cache_read_terminated, subreq);
>  }
>  

The above two deltas seem like they should have been in patch #2.

> @@ -419,7 +409,7 @@ static void netfs_rreq_unlock(struct netfs_read_request *rreq)
>  			if (pgend < iopos + subreq->len)
>  				break;
>  
> -			account += subreq->transferred;
> +			account += subreq->len - iov_iter_count(&subreq->iter);
>  			iopos += subreq->len;
>  			if (!list_is_last(&subreq->rreq_link, &rreq->subrequests)) {
>  				subreq = list_next_entry(subreq, rreq_link);
> @@ -635,15 +625,8 @@ void netfs_subreq_terminated(struct netfs_read_subrequest *subreq,
>  		goto failed;
>  	}
>  
> -	if (WARN(transferred_or_error > subreq->len - subreq->transferred,
> -		 "Subreq overread: R%x[%x] %zd > %zu - %zu",
> -		 rreq->debug_id, subreq->debug_index,
> -		 transferred_or_error, subreq->len, subreq->transferred))
> -		transferred_or_error = subreq->len - subreq->transferred;
> -
>  	subreq->error = 0;
> -	subreq->transferred += transferred_or_error;
> -	if (subreq->transferred < subreq->len)
> +	if (iov_iter_count(&subreq->iter))
>  		goto incomplete;
>  

I must be missing it, but where does subreq->iter get advanced to the
end of the current read? If you're getting rid of subreq->transferred
then I think that has to happen above, no?

>  complete:
> @@ -667,7 +650,6 @@ void netfs_subreq_terminated(struct netfs_read_subrequest *subreq,
>  incomplete:
>  	if (test_bit(NETFS_SREQ_CLEAR_TAIL, &subreq->flags)) {
>  		netfs_clear_unread(subreq);
> -		subreq->transferred = subreq->len;
>  		goto complete;
>  	}
>  
> diff --git a/include/linux/netfs.h b/include/linux/netfs.h
> index 5e4fafcc9480..45d40c622205 100644
> --- a/include/linux/netfs.h
> +++ b/include/linux/netfs.h
> @@ -116,7 +116,6 @@ struct netfs_read_subrequest {
>  	struct iov_iter		iter;		/* Iterator for this subrequest */
>  	loff_t			start;		/* Where to start the I/O */
>  	size_t			len;		/* Size of the I/O */
> -	size_t			transferred;	/* Amount of data transferred */
>  	refcount_t		usage;
>  	short			error;		/* 0 or error that occurred */
>  	unsigned short		debug_index;	/* Index in list (for debugging output) */
> diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
> index 4d470bffd9f1..04ac29fc700f 100644
> --- a/include/trace/events/netfs.h
> +++ b/include/trace/events/netfs.h
> @@ -190,7 +190,7 @@ TRACE_EVENT(netfs_sreq,
>  		    __field(enum netfs_read_source,	source		)
>  		    __field(enum netfs_sreq_trace,	what		)
>  		    __field(size_t,			len		)
> -		    __field(size_t,			transferred	)
> +		    __field(size_t,			remain		)
>  		    __field(loff_t,			start		)
>  			     ),
>  
> @@ -202,7 +202,7 @@ TRACE_EVENT(netfs_sreq,
>  		    __entry->source	= sreq->source;
>  		    __entry->what	= what;
>  		    __entry->len	= sreq->len;
> -		    __entry->transferred = sreq->transferred;
> +		    __entry->remain	= iov_iter_count(&sreq->iter);
>  		    __entry->start	= sreq->start;
>  			   ),
>  
> @@ -211,7 +211,7 @@ TRACE_EVENT(netfs_sreq,
>  		      __print_symbolic(__entry->what, netfs_sreq_traces),
>  		      __print_symbolic(__entry->source, netfs_sreq_sources),
>  		      __entry->flags,
> -		      __entry->start, __entry->transferred, __entry->len,
> +		      __entry->start, __entry->len - __entry->remain, __entry->len,
>  		      __entry->error)
>  	    );
>  
> @@ -230,7 +230,7 @@ TRACE_EVENT(netfs_failure,
>  		    __field(enum netfs_read_source,	source		)
>  		    __field(enum netfs_failure,		what		)
>  		    __field(size_t,			len		)
> -		    __field(size_t,			transferred	)
> +		    __field(size_t,			remain		)
>  		    __field(loff_t,			start		)
>  			     ),
>  
> @@ -242,7 +242,7 @@ TRACE_EVENT(netfs_failure,
>  		    __entry->source	= sreq ? sreq->source : NETFS_INVALID_READ;
>  		    __entry->what	= what;
>  		    __entry->len	= sreq ? sreq->len : 0;
> -		    __entry->transferred = sreq ? sreq->transferred : 0;
> +		    __entry->remain	= sreq ? iov_iter_count(&sreq->iter) : 0;
>  		    __entry->start	= sreq ? sreq->start : 0;
>  			   ),
>  
> @@ -250,7 +250,7 @@ TRACE_EVENT(netfs_failure,
>  		      __entry->rreq, __entry->index,
>  		      __print_symbolic(__entry->source, netfs_sreq_sources),
>  		      __entry->flags,
> -		      __entry->start, __entry->transferred, __entry->len,
> +		      __entry->start, __entry->len - __entry->remain, __entry->len,
>  		      __print_symbolic(__entry->what, netfs_failures),
>  		      __entry->error)
>  	    );
> 
> 

-- 
Jeff Layton <jlayton@redhat.com>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

