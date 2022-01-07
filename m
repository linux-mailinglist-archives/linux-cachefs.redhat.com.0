Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7C1487660
	for <lists+linux-cachefs@lfdr.de>; Fri,  7 Jan 2022 12:20:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641554424;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JLldDwEFIkneBR7O3eauGVtdsU/jrrekDqvmexuv6ww=;
	b=LbMyoWa8E8gi4NnKY937CKWztm+MR559HS0V6pTq2ElSNnwgcgwMEhDyLiW/wg3gKNs/8F
	m+cd7V/Lo0nCdZz862WQRksLOpbEzBZT4XNrJdkONU3G7c0DXhczEvSiqUJhLT8PUNEhqG
	vqROvtKGaK6UfOYXSsW/JspjK3BjoLs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-WIlygwkWNx6B3pg3lRmOtA-1; Fri, 07 Jan 2022 06:20:21 -0500
X-MC-Unique: WIlygwkWNx6B3pg3lRmOtA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A7331800D50;
	Fri,  7 Jan 2022 11:20:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3763106F758;
	Fri,  7 Jan 2022 11:20:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1CFB41809CB8;
	Fri,  7 Jan 2022 11:20:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 207BK5j1017721 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 7 Jan 2022 06:20:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1BC0E7E213; Fri,  7 Jan 2022 11:20:05 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7D1597E23A;
	Fri,  7 Jan 2022 11:19:53 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <1e102cc81aaf71df2b7f5ae906b79c188a34a111.camel@kernel.org>
References: <1e102cc81aaf71df2b7f5ae906b79c188a34a111.camel@kernel.org>
	<164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
	<164021549223.640689.14762875188193982341.stgit@warthog.procyon.org.uk>
To: Jeff Layton <jlayton@kernel.org>
MIME-Version: 1.0
Date: Fri, 07 Jan 2022 11:19:52 +0000
Message-ID: <3149374.1641554392@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 207BK5j1017721
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	v9fs-developer@lists.sourceforge.net, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH v4 44/68] cachefiles: Implement key to
	filename encoding
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
Content-ID: <3149373.1641554392.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeff Layton <jlayton@kernel.org> wrote:

> Since most cookies are fairly small, is there any real benefit to
> optimizing for length here? How much inflation are we talking about?

Taking AFS as an example, a vnode is represented at the file level by two
numbers: a 32-bit or 96-bit file ID and a 32-bit uniquifier.  If it's a 96-bit
file ID, a lot of the time, the upper 64-bits will be zero, so we're talking
something like:

	S421d4,1f07f34,,

instead of:

	S000421d401f07f340000000000000000

or:

	E0AAQh1AHwfzQAAAAAAAAAAA==

The first makes for a more readable name in the cache.  The real fun is with
NFS, where the name can be very long.  For one that's just 5 words in length:

	T81010001,1,20153e2,,a906194b

instead of:

	T8101000100000001020153e200000000a906194b

or:

	E0gQEAAQAAAAECAVPiAAAAAKkGGUs=

(The letter on the front represents the encoding scheme; in the base64 encoding
the second digit indicates the amount of padding).

I don't know how much difference it makes to the backing filesystem's
directory packing - and it may depend on the particular filesystem.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

