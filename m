Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A3756433D23
	for <lists+linux-cachefs@lfdr.de>; Tue, 19 Oct 2021 19:13:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634663606;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MRsZUTPoFeUj4U0PvAR6WOAaO+evVUiLxPIc076e6lc=;
	b=Xpu+6F/hCo72aGXqayUcX72ktMg2BiY5AVjoHVtOixrmJXnRIkh5VZWNJbBPM0Dde0bY6D
	hYN8P1D/fn7GmJDhasDrIS8TaajdFi1iX0Ytc9RTS9/3mc7PH0mQPjkeo3bMwG+dp97KGt
	1csABjLDMclv96PMBerK1aenQGQZZ+o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-5VaGOxAjP8SN5b_stiIW8w-1; Tue, 19 Oct 2021 13:13:23 -0400
X-MC-Unique: 5VaGOxAjP8SN5b_stiIW8w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05BBA800685;
	Tue, 19 Oct 2021 17:13:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3805A5BB06;
	Tue, 19 Oct 2021 17:13:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F2B294E58F;
	Tue, 19 Oct 2021 17:13:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19JHDAUE013884 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 19 Oct 2021 13:13:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CE45FF4EAA; Tue, 19 Oct 2021 17:13:10 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7063F4EBE
	for <linux-cachefs@redhat.com>; Tue, 19 Oct 2021 17:13:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2DA5800B28
	for <linux-cachefs@redhat.com>; Tue, 19 Oct 2021 17:13:07 +0000 (UTC)
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
	[209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-98-Yu2qNAIeMBu0EMYpIEnyEA-1; Tue, 19 Oct 2021 13:13:06 -0400
X-MC-Unique: Yu2qNAIeMBu0EMYpIEnyEA-1
Received: by mail-qv1-f72.google.com with SMTP id
	o15-20020a0cc38f000000b0038455e36f89so510253qvi.6
	for <linux-cachefs@redhat.com>; Tue, 19 Oct 2021 10:13:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=4i8IYWG9Vqjc7NrxHtrIVVcfleXY1klKtzfa0ewfz4w=;
	b=CN63fC5lP/icJtHRKeqZGVyS7qaZzv6xld5py3TfdxEghfTrbOJd9cEdESL+0up8/B
	8YQgl9+/AbI873BaieWBL+qUYgdVHCTqpswHRlioIkiHppbz/ovt9b7rz6lv1b7JlBIp
	7/FmjtdXMseFe2NcqJU8mTMYGLUFlVy/nBxuFuqvyoKRwoUD79FPhieIntiO6RuN3Gm9
	73AWdFncXKKcOisRmr82oNjlxULN0WiqKvuzZ8VBJpXDm5oO9C85iDc1iat0H4LzLijI
	RorxzzRytGkXR5KkasAIQ0keFoGUcu2zRRWa1chPgFkaWMqSIYdB5EbceWxHDUstF++A
	Ei0g==
X-Gm-Message-State: AOAM532FthiSQk0lPjXVwTGsdr4je5XIqQ6OnEWIUFS6wwmGhaNSzCE6
	BVomjFRuKQcsSMZNK+ShPws98hmlNnsPRr/2uLdZetxbynQeBceZdv02Wmtezk6mVN/VE1bZcD0
	fB9RhlLNXABeGjntOv1jOdQ==
X-Received: by 2002:ac8:59ce:: with SMTP id f14mr1309295qtf.418.1634663585807; 
	Tue, 19 Oct 2021 10:13:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCTLnI4O14CVDS0WnTvhZl4wAoj8tNDS3DFRVR0xteRC6rTs30rKL1ujbd9t4swW1RKTIeyw==
X-Received: by 2002:ac8:59ce:: with SMTP id f14mr1309267qtf.418.1634663585628; 
	Tue, 19 Oct 2021 10:13:05 -0700 (PDT)
Received: from [192.168.1.3] (68-20-15-154.lightspeed.rlghnc.sbcglobal.net.
	[68.20.15.154]) by smtp.gmail.com with ESMTPSA id
	s203sm8190618qke.21.2021.10.19.10.13.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 19 Oct 2021 10:13:05 -0700 (PDT)
Message-ID: <b8cd66bd0c6341b5f9fb8c885013bbb7a8abd3f2.camel@redhat.com>
From: Jeff Layton <jlayton@redhat.com>
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com
Date: Tue, 19 Oct 2021 13:13:04 -0400
In-Reply-To: <163456863216.2614702.6384850026368833133.stgit@warthog.procyon.org.uk>
References: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
	<163456863216.2614702.6384850026368833133.stgit@warthog.procyon.org.uk>
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, Dominique,
	Torvalds <torvalds@linux-foundation.org>,
	Martinet <asmadeus@codewreck.org>, ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	Kent Overstreet <kent.overstreet@gmail.com>,
	Steve French <sfrench@samba.org>, linux-mm@kvack.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net,
	Omar Sandoval <osandov@osandov.com>, Linus,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [PATCH 01/67] mm: Stop filemap_read() from
 grabbing a superfluous page
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2021-10-18 at 15:50 +0100, David Howells wrote:
> Under some circumstances, filemap_read() will allocate sufficient pages to
> read to the end of the file, call readahead/readpages on them and copy the
> data over - and then it will allocate another page at the EOF and call
> readpage on that and then ignore it.  This is unnecessary and a waste of
> time and resources.
> 
> filemap_read() *does* check for this, but only after it has already done
> the allocation and I/O.  Fix this by checking before calling
> filemap_get_pages() also.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> Acked-by: Kent Overstreet <kent.overstreet@gmail.com>
> cc: Matthew Wilcox (Oracle) <willy@infradead.org>
> cc: linux-mm@kvack.org
> cc: linux-fsdevel@vger.kernel.org
> Link: https://lore.kernel.org/r/160588481358.3465195.16552616179674485179.stgit@warthog.procyon.org.uk/
> ---
> 
>  mm/filemap.c |    4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/mm/filemap.c b/mm/filemap.c
> index dae481293b5d..c0cdc44c844e 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -2625,6 +2625,10 @@ ssize_t filemap_read(struct kiocb *iocb, struct iov_iter *iter,
>  		if ((iocb->ki_flags & IOCB_WAITQ) && already_read)
>  			iocb->ki_flags |= IOCB_NOWAIT;
>  
> +		isize = i_size_read(inode);
> +		if (unlikely(iocb->ki_pos >= isize))
> +			goto put_pages;
> +
>  		error = filemap_get_pages(iocb, iter, &pvec);
>  		if (error < 0)
>  			break;
> 
> 

I would wager that it's worth checking for this. I imagine read calls
beyond EOF are common enough that it's probably helpful to optimize that
case:

Acked-by: Jeff Layton <jlayton@redhat.com>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

