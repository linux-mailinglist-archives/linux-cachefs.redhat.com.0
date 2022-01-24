Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE514984AD
	for <lists+linux-cachefs@lfdr.de>; Mon, 24 Jan 2022 17:25:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643041523;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rHrwv9qKYiscvc3Je94QS48xzmzm2S9YDG4WuadHTaU=;
	b=F/lI2EUF6QGGxEx7/E3w8EfvLdmDNdkwZimMg3QCDDyb0cIp/RS8G0ov0OCsn7WLdU89k2
	iL0mbmHuHBSCtd5zPyjPQ5bFRlZEjIugxA3OeycHEfPux/NEFQWABduAVxXzlvzUCx8OhY
	LCmqg6y8X0UwufBUzybIhG8zQ5XhaSU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-Hk-YZ7UsMNm1t-ZUU1aBGA-1; Mon, 24 Jan 2022 11:25:20 -0500
X-MC-Unique: Hk-YZ7UsMNm1t-ZUU1aBGA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 580AC8024C7;
	Mon, 24 Jan 2022 16:25:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 123CD1091EEA;
	Mon, 24 Jan 2022 16:25:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EFB3B4BB7C;
	Mon, 24 Jan 2022 16:25:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20OGPDg3024294 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 24 Jan 2022 11:25:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A0FA71091EE9; Mon, 24 Jan 2022 16:25:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.5])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5063D10694E9;
	Mon, 24 Jan 2022 16:25:12 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <Ye7Ms67MA0kycc/x@casper.infradead.org>
References: <Ye7Ms67MA0kycc/x@casper.infradead.org>
	<Ye7GtNRgxkT9S6sG@casper.infradead.org>
	<Ye61jfhL7K9Ethxz@casper.infradead.org>
	<164303051132.2163193.10493291874899600548.stgit@warthog.procyon.org.uk>
	<2255918.1643037281@warthog.procyon.org.uk>
	<2270964.1643039187@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
Date: Mon, 24 Jan 2022 16:25:11 +0000
Message-ID: <2311840.1643041511@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
Cc: nspmangalore@gmail.com, linux-cifs@vger.kernel.org,
	Jeff Layton <jlayton@kernel.org>, smfrench@gmail.com,
	linux-cachefs@redhat.com
Subject: Re: [Linux-cachefs] [RFC PATCH] cifs: Transition from ->readpages()
	to ->readahead()
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
Content-ID: <2311839.1643041511.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Matthew Wilcox <willy@infradead.org> wrote:

> Well, that's the problem isn't it?  You're expecting to mutate the state
> and then refer to its previous state instead of its current state,

No.  I *don't* want to see the previous state.  That's where the problem is:
The previous state isn't cleared up until the point I ask for a new batch -
but I need to query the ractl to find the remaining window before I can ask
for a new batch.

The first pass through the loop is, in effect, substantially different to the
second and subsequent passes.

> whereas the other users refer to the current state instead of the
> previous state.

Fuse has exactly the same issues:

		nr_pages = readahead_count(rac) - nr_pages;
		if (nr_pages > max_pages)
			nr_pages = max_pages;
		if (nr_pages == 0)
			break;
		ia = fuse_io_alloc(NULL, nr_pages);
		...
		nr_pages = __readahead_batch(rac, ap->pages, nr_pages);

It needs to find out how many pages it needs so that it can allocate its page
array before it can get a new batch, but the ractl is holding the previous
state.

> Can't you pull readahead_index() out of the ractl ahead of the mutation?

I'm not sure what you mean by that.  What I'm now doing is:

	while ((nr_pages = readahead_count(ractl) - ractl->_batch_count)) {
		...
		pgoff_t index = readahead_index(ractl) + ractl->_batch_count;
		...
		rc = cifs_fscache_query_occupancy(
			ractl->mapping->host, index, nr_pages,
		...
		rc = server->ops->wait_mtu_credits(server, cifs_sb->ctx->rsize,
						   &rsize, credits);
		...
		nr_pages = min_t(size_t, rsize / PAGE_SIZE, readahead_count(ractl));
		nr_pages = min_t(size_t, nr_pages, next_cached - index);
		...
		rdata = cifs_readdata_alloc(nr_pages, cifs_readv_complete);
		...
		got = __readahead_batch(ractl, rdata->pages, nr_pages);
		...
	}

I need the count to know how many, if any, pages are remaining; I need the
count and index of the window to find out if fscache has any data; I need the
count to allocate a page array.  Only after all that can I crank the next
batch for the server (assuming I didn't delegate to the cache along the way,
but that calls readahead_page()).

(Yes, I would like to remove this code entirely and just call into netfslib.
I have patches to do that, but it involves quite an overhaul of the cifs
driver, but the above might get cifs caching again more quickly pending that.
Maybe I should just take the easy way here and cache the last state so that I
can compensate in the way fuse does).

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

