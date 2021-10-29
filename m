Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB9E44029D
	for <lists+linux-cachefs@lfdr.de>; Fri, 29 Oct 2021 20:55:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635533721;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ABTcfG5l2qSuyNqUbEl3BXscdnTfieIebkG3Y+pk8j4=;
	b=CbxAwqUTcDwhREq3VXEwUB8G32b/R5nLTmzpGUI53a3Ty2Y1+vTAwlgjQTY0DLXQx69ZHm
	dK2JFIWqwJEKgBnvJXyouPDfls6O1zeK0d4MhfhftgxMJyV7hCOicFRS09pTpK9PO+GbiO
	F/VFQNkGqFGbRb7Mm7iLFe/k57sCJuE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-vB8FT3yBP9yTkkJTLWrOtA-1; Fri, 29 Oct 2021 14:55:15 -0400
X-MC-Unique: vB8FT3yBP9yTkkJTLWrOtA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2E7C19200C4;
	Fri, 29 Oct 2021 18:55:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D45F1017CE3;
	Fri, 29 Oct 2021 18:55:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0C0FD1806D03;
	Fri, 29 Oct 2021 18:55:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19TIprfh006019 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 29 Oct 2021 14:51:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F30E76F951; Fri, 29 Oct 2021 18:51:52 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E18845D6CF;
	Fri, 29 Oct 2021 18:51:34 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAHk-=wg_C6V_S+Aox5Fn7MuFe13ADiRVnh6UcvY4WX9JjXn3dg@mail.gmail.com>
References: <CAHk-=wg_C6V_S+Aox5Fn7MuFe13ADiRVnh6UcvY4WX9JjXn3dg@mail.gmail.com>
	<163551653404.1877519.12363794970541005441.stgit@warthog.procyon.org.uk>
	<CAHk-=wiy4KNREEqvd10Ku8VVSY1Lb=fxTA1TzGmqnLaHM3gdTg@mail.gmail.com>
	<1889041.1635530124@warthog.procyon.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Date: Fri, 29 Oct 2021 19:51:34 +0100
Message-ID: <1891411.1635533494@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 19TIprfh006019
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, "open list:NFS, SUNRPC,
	AND..." <linux-nfs@vger.kernel.org>, linux-afs@lists.infradead.org,
	CIFS <linux-cifs@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Shyam Prasad N <nspmangalore@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH v4 00/10] fscache: Replace and remove
	old I/O API
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1891410.1635533494.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Linus Torvalds <torvalds@linux-foundation.org> wrote:

> But:
> 
> > However, if you would rather I just removed all of fscache and (most of[*])
> > cachefiles, that I can do.
> 
> I assume and think that if you just do that part first, then the
> "convert to netfslib" of afs and ceph at that later stage will mean
> that the fallback code will never be needed?

The netfslib coversions for afs and ceph are already in your tree and I have a
patch here to do that for 9p (if you're willing to take that in the upcoming
merge window?).

The issue is cifs[*] and nfs.  I could leave caching in those disabled,
pending approved patches for those filesystems.  This would mean that I
wouldn't need the fallback code.

An alternative is that I could move the "fallback" code into fs/nfs/fscache.c
and fs/cifs/fscache.c if that would be easier and merge it into the functions
there.  The problem will come when the cache wants to do I/O in larger units
than page size to suit its own block size[**].

David

[*] As it happens, it turns out that cifs seems to have a bug in it that
causes the entire cache for a superblock to be discarded each time that
superblock is mounted.

[**] At some point the cache *has* to start keeping track of what data it is
holding rather than relying on bmap/SEEK_DATA/SEEK_HOLE to get round the
extent-bridging problem.  I'm trying to take a leaf out of the book of other
caching filesystems and use larger block sizes (e.g. 256K) to reduce the
overhead of cache metadata.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

