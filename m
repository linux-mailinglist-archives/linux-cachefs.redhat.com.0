Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC1D463FA4
	for <lists+linux-cachefs@lfdr.de>; Tue, 30 Nov 2021 22:06:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638306379;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UHrmvD6El8ruj+XxZgkFmrbC2r8AsB2qGejmVOyBmK8=;
	b=PP6Emh88T5Q9rIXkIO2wqDRNwW0PAkmo+6qgPgrKcaunZsKF4C3swEjVpBtAd8JrR6edsg
	Mu6LsDPUlK1D7PqVlOO/7MShBWbXXnuPuqoZ6l+5wRS6c5foN9CUwopvdLf2UZxJpbKCeW
	aPSVdlDdd+1dZEwnuHH04Yr16TlJA20=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-ddR5JCb6NByltM_MekgyUA-1; Tue, 30 Nov 2021 16:06:15 -0500
X-MC-Unique: ddR5JCb6NByltM_MekgyUA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC9EB10144E1;
	Tue, 30 Nov 2021 21:06:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B1A960854;
	Tue, 30 Nov 2021 21:06:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B6C501809C89;
	Tue, 30 Nov 2021 21:06:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AUL65iZ032680 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 30 Nov 2021 16:06:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6FEF610023B8; Tue, 30 Nov 2021 21:06:05 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BABF910013D7;
	Tue, 30 Nov 2021 21:05:49 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <YaZOCk9zxApPattb@archlinux-ax161>
References: <YaZOCk9zxApPattb@archlinux-ax161>
	<163819575444.215744.318477214576928110.stgit@warthog.procyon.org.uk>
	<163819647945.215744.17827962047487125939.stgit@warthog.procyon.org.uk>
To: Nathan Chancellor <nathan@kernel.org>
MIME-Version: 1.0
Date: Tue, 30 Nov 2021 21:05:48 +0000
Message-ID: <503522.1638306348@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1AUL65iZ032680
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	llvm@lists.linux.dev, Jeff Layton <jlayton@kernel.org>,
	linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org,
	v9fs-developer@lists.sourceforge.net, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 51/64] cachefiles: Implement the I/O
	routines
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
Content-ID: <503521.1638306348.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Nathan Chancellor <nathan@kernel.org> wrote:

> This patch as commit 0443b01eccbb ("cachefiles: Implement the I/O
> routines") in -next causes the following clang warning/error:
> 
> fs/cachefiles/io.c:489:6: error: variable 'ret' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>         if (pos == 0)
>             ^~~~~~~~
> fs/cachefiles/io.c:492:6: note: uninitialized use occurs here
>         if (ret < 0) {
>             ^~~
> fs/cachefiles/io.c:489:2: note: remove the 'if' if its condition is always true
>         if (pos == 0)
>         ^~~~~~~~~~~~~
> fs/cachefiles/io.c:440:9: note: initialize the variable 'ret' to silence this warning
>         int ret;
>                ^
>                 = 0
> 1 error generated.

	pos = cachefiles_inject_remove_error();
	if (pos == 0)
		ret = vfs_fallocate(file, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,

That should be:

	ret = cachefiles_inject_remove_error();
	if (ret == 0)
		ret = vfs_fallocate(file, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

