Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 48B5A3F76D3
	for <lists+linux-cachefs@lfdr.de>; Wed, 25 Aug 2021 16:04:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629900275;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PJCJs1rwywOUCRMmUoOYuJRJrsWLsUDufnoYHxxdlSw=;
	b=hCt5ilBg4nAhvculKkewc6XIaNQs+IybLUIbIrj4GSqge872/p5j1zL6hEUjuaPIgtIjE+
	vL9uWKCeRRS4kTVNWsKVCB0fpEXkuUwpoU6evUajMFLNnabq/ff8NRgx7xHjywJNUHR56s
	vUQpZnYa4tKGhYPJ8bzvLkusAz41DkE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-PFwo_kOBNUOEqbWYUBhKDQ-1; Wed, 25 Aug 2021 10:04:33 -0400
X-MC-Unique: PFwo_kOBNUOEqbWYUBhKDQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94F4D1008079;
	Wed, 25 Aug 2021 14:04:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6069A797C0;
	Wed, 25 Aug 2021 14:04:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F2122181A0F2;
	Wed, 25 Aug 2021 14:04:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17PE4Ov6021206 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 25 Aug 2021 10:04:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 270C22B3C5; Wed, 25 Aug 2021 14:04:24 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DB6F72B3DF;
	Wed, 25 Aug 2021 14:04:09 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <3d98729b59c2afcad1299a7742211bcdf1598623.camel@redhat.com>
References: <3d98729b59c2afcad1299a7742211bcdf1598623.camel@redhat.com>
	<162431188431.2908479.14031376932042135080.stgit@warthog.procyon.org.uk>
	<162431201844.2908479.8293647220901514696.stgit@warthog.procyon.org.uk>
To: Jeff Layton <jlayton@redhat.com>
MIME-Version: 1.0
Date: Wed, 25 Aug 2021 15:04:08 +0100
Message-ID: <2030821.1629900248@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>,
	linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH 10/12] fscache: Fix cookie key hashing
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
Content-ID: <2030820.1629900248.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeff Layton <jlayton@redhat.com> wrote:

> What happens when this patch encounters a cache that was built before
> it? Do you need to couple this with some sort of global cache
> invalidation or rehashing event?

At the moment, nothing.  cachefiles generates a second hash value, but doing
so is a duplication of effort.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

