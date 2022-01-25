Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1559449B863
	for <lists+linux-cachefs@lfdr.de>; Tue, 25 Jan 2022 17:16:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643127397;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oEgZhDXSrAHHERTlvNOPrr7yPlJ5mfQaq0C89V2wK38=;
	b=PViTI4WZb8a1I3hsvBJw/dKybway1tjx/BowBRGshB7aAwQvlncJN0AUxKDgJDcimHW59p
	1WNRMFoffuJA8nKBJyMTIPlyq0KHnD6Q2vAYYll8n7skrA2qFjal3hpy8tvA1HlbyXRp1t
	NC93j4rR/silx0XG0Bqa2RC7+PDOnjU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-30-Rcgs3WC4MKSz3tS84BV7Gg-1; Tue, 25 Jan 2022 11:16:32 -0500
X-MC-Unique: Rcgs3WC4MKSz3tS84BV7Gg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 118EA1083F61;
	Tue, 25 Jan 2022 16:16:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C81FB84D02;
	Tue, 25 Jan 2022 16:16:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 87BF24BB7C;
	Tue, 25 Jan 2022 16:16:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20PGGJW8002023 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 25 Jan 2022 11:16:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C755784D02; Tue, 25 Jan 2022 16:16:19 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.5])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 62E6484D08;
	Tue, 25 Jan 2022 16:15:31 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20220118131216.85338-1-jefflexu@linux.alibaba.com>
References: <20220118131216.85338-1-jefflexu@linux.alibaba.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
MIME-Version: 1.0
Date: Tue, 25 Jan 2022 16:15:30 +0000
Message-ID: <2815558.1643127330@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 20PGGJW8002023
X-loop: linux-cachefs@redhat.com
Cc: chao@kernel.org, tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, linux-cachefs@redhat.com,
	bo.liu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
	xiang@kernel.org, gerry@linux.alibaba.com,
	linux-erofs@lists.ozlabs.org, eguan@linux.alibaba.com
Subject: Re: [Linux-cachefs] [PATCH v2 00/20] fscache,
	erofs: fscache-based demand-read semantics
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
Content-ID: <2815557.1643127330.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeffle Xu <jefflexu@linux.alibaba.com> wrote:

> The following issues still need further discussion. Thanks for your time
> and patience.
> 
> 1. I noticed that there's refactoring of netfs library[1],
> ...
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=netfs-lib

Yes.  I'm working towards getting netfslib to do handling writes and dio as
well as reads, along with content crypto/compression, and the idea I'm aiming
towards is that you just point your address_space_ops at netfs directly if
possible - but it's going to require its own context now to manage pending
writes.

See my netfs-experimental branch for more of that - it's still a work in
progress, though.

Btw, you could set rreq->netfs_priv in ->init_rreq() rather than passing it in
to netfs_readpage().

> 2. The current implementation will severely conflict with the
> refactoring of netfs library[1][2]. The assumption of 'struct
> netfs_i_context' [2] is that, every file in the upper netfs will
> correspond to only one backing file. While in our scenario, one file in
> erofs can correspond to multiple backing files. That is, the content of
> one file can be divided into multiple chunks, and are distrubuted over
> multiple blob files, i.e. multiple backing files. Currently I have no
> good idea solving this conflic.

I can think of a couple of options to explore:

 (1) Duplicate the cachefiles backend.  You can discard a lot of it, since a
     much of it is concerned with managing local modifications - which you're
     not going to do since you have a R/O filesystem and you're looking at
     importing files into the cache externally to the kernel.

     I would suggest looking to see if you can do the blob mapping in the
     backend rather than passing the offset down.  Maybe make the cookie index
     key hold the index too, e.g. "/path/to/file+offset".

     Btw, do you still need cachefilesd for its culling duties?

 (2) Do you actually need to go through netfslib?  Might it be easier to call
     fscache_read() directly?  Have a look at fs/nfs/fscache.c

> Besides there are still two quetions:
> - What's the plan of [1]? When is it planned to be merged?

Hopefully next merge window, but that's going to depend on a number of things.

> - It seems that all upper fs using fscache is going to use netfs API,
>   while the APIs like fscache_read_or_alloc_page() are deprecated. Is
>   that true?

fscache_read_or_alloc_page() is gone completely.

You don't have to use the netfs API.  You can talk to fscache directly,
doing DIO from the cache to an xarray-class iov_iter constructed from your
inode's pagecache.

netfslib provides/will provide a number of services, such as multipage
folios, transparent caching, crypto, compression and hiding the existence of
pages/folios from the filesystem as entirely as possible.  However, you
already have some of these implemented on top of iomap for the blockdev
interface, it would appear.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

