Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id BD291233251
	for <lists+linux-cachefs@lfdr.de>; Thu, 30 Jul 2020 14:36:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596112596;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2wSjZ1bzZoQ14c37lgry9zl1XCs4p7AjLPU97uRQM2U=;
	b=I/7Urfw75JV7S/TQFmnFrPExdKxodMG0VZzdouyv8u18xMEF7l9GfHS+tcz4oC0cFXAWPy
	cLQFz0vJVD0D510o0qRB4ajiXCTh1SOF/X/Mk7ZjfCGvcrX+2wd6D0SNzWc1E8uSQ0QIgB
	hO61PnpLB/9buYnAoBfdeiPPvH0iKlo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-MPBKd4u7O3q_yN2MZ9sZng-1; Thu, 30 Jul 2020 08:36:26 -0400
X-MC-Unique: MPBKd4u7O3q_yN2MZ9sZng-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD495100AA22;
	Thu, 30 Jul 2020 12:36:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADE1471927;
	Thu, 30 Jul 2020 12:36:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 945D51809561;
	Thu, 30 Jul 2020 12:36:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06UCaLlh005158 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 30 Jul 2020 08:36:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C829487B03; Thu, 30 Jul 2020 12:36:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-32.rdu2.redhat.com
	[10.10.112.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 895FC87B07;
	Thu, 30 Jul 2020 12:36:15 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200730121622.GB23808@casper.infradead.org>
References: <20200730121622.GB23808@casper.infradead.org>
	<447452.1596109876@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
Content-ID: <488586.1596112574.1@warthog.procyon.org.uk>
Date: Thu, 30 Jul 2020 13:36:14 +0100
Message-ID: <488587.1596112574@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	torvalds@linux-foundation.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [Linux-cachefs] Upcoming: fscache rewrite
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Matthew Wilcox <willy@infradead.org> wrote:

> I suspect you don't need to call find_get_pages_contig().  If you look
> at __readahead_batch() in pagemap.h, it does basically what you want
> (other than being wrapped up inside the readahead iterator).  You require
> the pages already be pinned in the xarray, so there's no need for the
> page_cache_get_speculative() dance that find_get_pages_contig) does,
> nor the check for xa_is_value().

I'll have a look at that.

> My main concern with your patchset is that it introduces a new page flag

Technically, the flag already exists - I'm just using it for something
different than the old fscache code used it for.

> to sleep on which basically means "I am writing this page to the fscache".
> I don't understand why you need it; you've elevated the refcount on
> the pages so they're not going to get reused for another purpose.
> All it does (as far as I can tell) is make a task calling truncate()
> wait for the page to finish being written to cache, which isn't actually
> necessary.

It's also used to prevent starting overlapping async DIO writes to the cache.

See fscache_read_done(), where it's set to cover writing what we've just read
from the server to the cache, and afs_write_back_from_locked_page(), where
it's set to cover writing the data to be written back to the cache.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

