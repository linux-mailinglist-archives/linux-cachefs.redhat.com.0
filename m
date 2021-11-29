Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AED63461C14
	for <lists+linux-cachefs@lfdr.de>; Mon, 29 Nov 2021 17:46:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638204411;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6maCdhunFvUgNaxIThBBqu5X+3ccSzWf50p+a9WaeHI=;
	b=BjeYIxFKVaqYLF2Y7R6R7AWZFQSmBqVO0vYRL9f4nPAbt8D6fX9/s6AFcODKR9eEDeHmwv
	1XjK0+31VAdeXfH0S88P/E137tYI2i2pzemNDXJpqPusnyX2bvAbbl7jFiA/4/UndZAvP2
	qVQRNQjkFuZcWGjHwaGfclvJ2t0HP7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-OYzd0mgWPde2iUZvMiBd8Q-1; Mon, 29 Nov 2021 11:46:50 -0500
X-MC-Unique: OYzd0mgWPde2iUZvMiBd8Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D36BD1926DA1;
	Mon, 29 Nov 2021 16:46:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C49A76613;
	Mon, 29 Nov 2021 16:46:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 379B84A700;
	Mon, 29 Nov 2021 16:46:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1ATGkglW018832 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 29 Nov 2021 11:46:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3D9EF19D9F; Mon, 29 Nov 2021 16:46:42 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BAC6319724;
	Mon, 29 Nov 2021 16:46:37 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20211129162907.149445-2-jlayton@kernel.org>
References: <20211129162907.149445-2-jlayton@kernel.org>
	<20211129162907.149445-1-jlayton@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
MIME-Version: 1.0
Date: Mon, 29 Nov 2021 16:46:36 +0000
Message-ID: <278917.1638204396@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-cachefs@redhat.com
Cc: linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	idryomov@gmail.com
Subject: Re: [Linux-cachefs] [PATCH 1/2] ceph: conversion to new fscache API
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <278916.1638204396.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeff Layton <jlayton@kernel.org> wrote:

> +void ceph_fscache_unregister_inode_cookie(struct ceph_inode_info* ci)
>  {
> -	return fscache_register_netfs(&ceph_cache_netfs);
> +	struct fscache_cookie* cookie = xchg(&ci->fscache, NULL);
> +
> +	fscache_relinquish_cookie(cookie, false);
>  }

xchg() should be excessive there.  This is only called from
ceph_evict_inode().  Also, if you're going to reset the pointer, it might be
worth poisoning it rather than nulling it.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

