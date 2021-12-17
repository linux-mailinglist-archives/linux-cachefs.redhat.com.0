Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B277478C1E
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Dec 2021 14:21:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639747288;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=K3YwKW5C54uFs6ka3CKhnjLlii1xU6alH7gEdREzhRY=;
	b=Zs5UQiVlxuYE8lci7icvT9Y1rhEQ4OD58NmEpNmw/Zqftn+lhKQYHFvF0h3L3DfqItC7qh
	nYg8GDg6kJZCReNBihKVUBwicAdYjMnFdW/7C3SBs2aVisZQGsxJTZUT89aGuiCxZE86h9
	CBdcoQLbWLTVxKMNcrsEjRrhJf4Om2A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-ODLjzwdhMFe4E5LN2OYrsg-1; Fri, 17 Dec 2021 08:21:18 -0500
X-MC-Unique: ODLjzwdhMFe4E5LN2OYrsg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00D0F10247A8;
	Fri, 17 Dec 2021 13:21:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E609645D64;
	Fri, 17 Dec 2021 13:21:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 68E854CA93;
	Fri, 17 Dec 2021 13:21:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BHDLCP9016666 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 17 Dec 2021 08:21:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 96BFC610AE; Fri, 17 Dec 2021 13:21:12 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F367E5C2EF;
	Fri, 17 Dec 2021 13:21:02 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CALF+zOkvC7kZ9LFQyjsRduQq+-gmaD4bLWc7H=AtVi6=NuC_dA@mail.gmail.com>
References: <CALF+zOkvC7kZ9LFQyjsRduQq+-gmaD4bLWc7H=AtVi6=NuC_dA@mail.gmail.com>
	<163967073889.1823006.12237147297060239168.stgit@warthog.procyon.org.uk>
	<163967182112.1823006.7791504655391213379.stgit@warthog.procyon.org.uk>
To: David Wysochanski <dwysocha@redhat.com>
MIME-Version: 1.0
Date: Fri, 17 Dec 2021 13:21:01 +0000
Message-ID: <1958026.1639747261@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1BHDLCP9016666
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs <linux-nfs@vger.kernel.org>, Jeff Layton <jlayton@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	linux-cachefs <linux-cachefs@redhat.com>,
	Trond Myklebust <trondmy@hammerspace.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Subject: Re: [Linux-cachefs] [PATCH v3 63/68] nfs: Convert to new fscache
	volume/cookie API
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1958025.1639747261.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

David Wysochanski <dwysocha@redhat.com> wrote:

> >
> >  (4) fscache_enable/disable_cookie() have been removed.
> >
> >      Call fscache_use_cookie() and fscache_unuse_cookie() when a file is
> >      opened or closed to prevent a cache file from being culled and to keep
> >      resources to hand that are needed to do I/O.
> >
> >      Unuse the cookie when a file is opened for writing.  This is gated by
> >      the NFS_INO_FSCACHE flag on the nfs_inode.
> >
> >      A better way might be to invalidate it with FSCACHE_INVAL_DIO_WRITE
> >      which will keep it unused until all open files are closed.
> >
> 
> Comment still out of date here, reference
> https://marc.info/?l=linux-nfs&m=163922984027745&w=4

Okay, how about:

 (4) fscache_enable/disable_cookie() have been removed.

     Call fscache_use_cookie() and fscache_unuse_cookie() when a file is
     opened or closed to prevent a cache file from being culled and to keep
     resources to hand that are needed to do I/O.

     If a file is opened for writing, we invalidate it with
     FSCACHE_INVAL_DIO_WRITE in lieu of doing writeback to the cache,
     thereby making it cease caching until all currently open files are
     closed.  This should give the same behaviour as the uptream code.
     Making the cache store local modifications isn't straightforward for
     NFS, so that's left for future patches.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

