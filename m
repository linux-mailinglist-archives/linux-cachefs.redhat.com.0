Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id AEDF63D14F2
	for <lists+linux-cachefs@lfdr.de>; Wed, 21 Jul 2021 19:17:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626887830;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mb0gdtPKSQn4mPu4d7owNqyQ8MKDB6J0wCkmna3st9I=;
	b=iAH3JUXNIMQb6x+mylIYLxgOYP6BVPHznGCYzff6INDTko54mBDuFj4kBADcUaEBZLR13u
	Rz8yN9ayin3E7RRXCzml8/Y0Vp5soSpWHlJOISs00x4drfVnOYQVZDCh2jVvAq5IDR6e2z
	DIuiBh6uyusT5CO/kYfwR/dSCKRMV0I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-WLIo1lc7PReBRW6Sm4AXFQ-1; Wed, 21 Jul 2021 13:17:09 -0400
X-MC-Unique: WLIo1lc7PReBRW6Sm4AXFQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 265661012D94;
	Wed, 21 Jul 2021 17:17:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC2F117D8B;
	Wed, 21 Jul 2021 17:17:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F00574BB7C;
	Wed, 21 Jul 2021 17:17:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16LHH2N4031525 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 21 Jul 2021 13:17:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 71068207AD67; Wed, 21 Jul 2021 17:17:02 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CF2E203CE5E
	for <linux-cachefs@redhat.com>; Wed, 21 Jul 2021 17:16:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A94D4800186
	for <linux-cachefs@redhat.com>; Wed, 21 Jul 2021 17:16:59 +0000 (UTC)
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
	[209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-173-mMKZReVKPb-sy1HaYZysWA-1; Wed, 21 Jul 2021 13:16:58 -0400
X-MC-Unique: mMKZReVKPb-sy1HaYZysWA-1
Received: by mail-qv1-f72.google.com with SMTP id
	p6-20020a05621415c6b02902f61b4b012eso2014629qvz.2
	for <linux-cachefs@redhat.com>; Wed, 21 Jul 2021 10:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=45Nv4CwiblR8FGtkBjhkDjeZeYsNgqMrzsXCoaXKlcs=;
	b=sYPW4mUpcizHT+dui+eJnQs2cSA9wohjnIJfDXk1MmjaxUc0YVaY4rf6tAAlkeJr7O
	M4RHdqNCaJzgax4pLgCtKwri15u/U4JDZHcgBVSZRh+HyJbPZ/iqH1+Fe1vgELX11Lgx
	K//u6TpvYatW1DpzZOvpnvkOflvTC8ZHD7D++p3f6Kf3mP3qljUMUDZSjwHYl/zLPa+8
	i7JPEUhQKVvP8zhNvl+5PivvWZD4XbSmMNT3Jh35CuOvqE9bLMzEzu5z8FtxHJX+7CgC
	fiNTrnbRWhVy8ET50suFKBeIFIvZ20lpI0zF12kH/BsE/m/aDcyXQ19ahMlBZlP8qRmb
	69Aw==
X-Gm-Message-State: AOAM533nrXvxpi/qIh1mQocZhw8sy5oKz/0uIGwTnfhmlfidRcfIhhFX
	YpuN843CIawvNwVvCPnlKCFQTItOletp+AMHytdjnpwKpzENbK8P6sszoRkM1bgtd2fao8PLZPh
	bUL58sTuovl2g/Jch9rnajw==
X-Received: by 2002:ad4:45a6:: with SMTP id y6mr36933552qvu.1.1626887817697;
	Wed, 21 Jul 2021 10:16:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwroCy17a7YpgGcviCUSg3J+GVy+n4E5MAqofjS2RsLBi/0nF/2omAf2j+swlCqTU83eT+04Q==
X-Received: by 2002:ad4:45a6:: with SMTP id y6mr36933536qvu.1.1626887817521;
	Wed, 21 Jul 2021 10:16:57 -0700 (PDT)
Received: from [192.168.1.3] (68-20-15-154.lightspeed.rlghnc.sbcglobal.net.
	[68.20.15.154])
	by smtp.gmail.com with ESMTPSA id t6sm1744741qkg.75.2021.07.21.10.16.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 21 Jul 2021 10:16:57 -0700 (PDT)
Message-ID: <0555748529d483fb9b69eceb56bf9ebc1efceaf1.camel@redhat.com>
From: Jeff Layton <jlayton@redhat.com>
To: David Howells <dhowells@redhat.com>, linux-fsdevel@vger.kernel.org
Date: Wed, 21 Jul 2021 13:16:56 -0400
In-Reply-To: <162687509306.276387.7579641363406546284.stgit@warthog.procyon.org.uk>
References: <162687506932.276387.14456718890524355509.stgit@warthog.procyon.org.uk>
	<162687509306.276387.7579641363406546284.stgit@warthog.procyon.org.uk>
User-Agent: Evolution 3.40.3 (3.40.3-1.fc34)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
Subject: Re: [Linux-cachefs] [RFC PATCH 02/12] netfs: Add an iov_iter to the
 read subreq for the network fs/cache to use
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

On Wed, 2021-07-21 at 14:44 +0100, David Howells wrote:
> Add an iov_iter to the read subrequest and set it up to define the
> destination buffer to write into.  This will allow future patches to point
> to a bounce buffer instead for purposes of handling oversize writes,
> decryption (where we want to save the encrypted data to the cache) and
> decompression.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> ---
> 
>  fs/afs/file.c          |    6 +-----
>  fs/netfs/read_helper.c |    5 ++++-
>  include/linux/netfs.h  |    2 ++
>  3 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/afs/file.c b/fs/afs/file.c
> index c9c21ad0e7c9..ca529f23515a 100644
> --- a/fs/afs/file.c
> +++ b/fs/afs/file.c
> @@ -319,11 +319,7 @@ static void afs_req_issue_op(struct netfs_read_subrequest *subreq)
>  	fsreq->len	= subreq->len   - subreq->transferred;
>  	fsreq->key	= subreq->rreq->netfs_priv;
>  	fsreq->vnode	= vnode;
> -	fsreq->iter	= &fsreq->def_iter;
> -
> -	iov_iter_xarray(&fsreq->def_iter, READ,
> -			&fsreq->vnode->vfs_inode.i_mapping->i_pages,
> -			fsreq->pos, fsreq->len);
> +	fsreq->iter	= &subreq->iter;
>  
>  	afs_fetch_data(fsreq->vnode, fsreq);
>  }
> diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
> index 0b6cd3b8734c..715f3e9c380d 100644
> --- a/fs/netfs/read_helper.c
> +++ b/fs/netfs/read_helper.c
> @@ -150,7 +150,7 @@ static void netfs_clear_unread(struct netfs_read_subrequest *subreq)
>  {
>  	struct iov_iter iter;
>  
> -	iov_iter_xarray(&iter, WRITE, &subreq->rreq->mapping->i_pages,
> +	iov_iter_xarray(&iter, READ, &subreq->rreq->mapping->i_pages,

What's up with the WRITE -> READ change here? Was that a preexisting
bug?

>  			subreq->start + subreq->transferred,
>  			subreq->len   - subreq->transferred);
>  	iov_iter_zero(iov_iter_count(&iter), &iter);
> @@ -745,6 +745,9 @@ netfs_rreq_prepare_read(struct netfs_read_request *rreq,
>  	if (WARN_ON(subreq->len == 0))
>  		source = NETFS_INVALID_READ;
>  
> +	iov_iter_xarray(&subreq->iter, READ, &rreq->mapping->i_pages,
> +			subreq->start, subreq->len);
> +
>  out:
>  	subreq->source = source;
>  	trace_netfs_sreq(subreq, netfs_sreq_trace_prepare);
> diff --git a/include/linux/netfs.h b/include/linux/netfs.h
> index fe9887768292..5e4fafcc9480 100644
> --- a/include/linux/netfs.h
> +++ b/include/linux/netfs.h
> @@ -17,6 +17,7 @@
>  #include <linux/workqueue.h>
>  #include <linux/fs.h>
>  #include <linux/pagemap.h>
> +#include <linux/uio.h>
>  
>  /*
>   * Overload PG_private_2 to give us PG_fscache - this is used to indicate that
> @@ -112,6 +113,7 @@ struct netfs_cache_resources {
>  struct netfs_read_subrequest {
>  	struct netfs_read_request *rreq;	/* Supervising read request */
>  	struct list_head	rreq_link;	/* Link in rreq->subrequests */
> +	struct iov_iter		iter;		/* Iterator for this subrequest */
>  	loff_t			start;		/* Where to start the I/O */
>  	size_t			len;		/* Size of the I/O */
>  	size_t			transferred;	/* Amount of data transferred */
> 
> 

-- 
Jeff Layton <jlayton@redhat.com>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

