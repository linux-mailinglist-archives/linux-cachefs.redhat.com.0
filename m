Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DAE49B68E
	for <lists+linux-cachefs@lfdr.de>; Tue, 25 Jan 2022 15:43:14 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-e6zyBcYyMUSJZhzAxLonNg-1; Tue, 25 Jan 2022 09:43:10 -0500
X-MC-Unique: e6zyBcYyMUSJZhzAxLonNg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 898091006AA0;
	Tue, 25 Jan 2022 14:43:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 381ED7553C;
	Tue, 25 Jan 2022 14:43:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6D3961809CB8;
	Tue, 25 Jan 2022 14:43:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20PEfY0h026600 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 25 Jan 2022 09:41:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D7F222166B5E; Tue, 25 Jan 2022 14:41:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1D542166B4F
	for <linux-cachefs@redhat.com>; Tue, 25 Jan 2022 14:41:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BAF191C022A3
	for <linux-cachefs@redhat.com>; Tue, 25 Jan 2022 14:41:31 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-644-gowIYEuFM1mb-ejQWmxcdQ-1; Tue, 25 Jan 2022 09:41:29 -0500
X-MC-Unique: gowIYEuFM1mb-ejQWmxcdQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1nCN0h-002ytE-Rg; Tue, 25 Jan 2022 14:41:27 +0000
Date: Tue, 25 Jan 2022 14:41:27 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <YfAMF/azs+59zNiU@casper.infradead.org>
References: <Ye7Ms67MA0kycc/x@casper.infradead.org>
	<Ye7GtNRgxkT9S6sG@casper.infradead.org>
	<Ye61jfhL7K9Ethxz@casper.infradead.org>
	<164303051132.2163193.10493291874899600548.stgit@warthog.procyon.org.uk>
	<2255918.1643037281@warthog.procyon.org.uk>
	<2270964.1643039187@warthog.procyon.org.uk>
	<2311840.1643041511@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <2311840.1643041511@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: nspmangalore@gmail.com, smfrench@gmail.com, linux-cachefs@redhat.com,
	Jeff Layton <jlayton@kernel.org>, linux-cifs@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 24, 2022 at 04:25:11PM +0000, David Howells wrote:
> Matthew Wilcox <willy@infradead.org> wrote:
> 
> > Well, that's the problem isn't it?  You're expecting to mutate the state
> > and then refer to its previous state instead of its current state,
> 
> No.  I *don't* want to see the previous state.  That's where the problem is:
> The previous state isn't cleared up until the point I ask for a new batch -
> but I need to query the ractl to find the remaining window before I can ask
> for a new batch.

Oh, right, even worse -- you want to know the _future_ state of the
iterator before you mutate it (it's kind of the same thing though
if you haven't looked at how the iterator works internally).

> > whereas the other users refer to the current state instead of the
> > previous state.
> 
> Fuse has exactly the same issues:

... and yet you refuse to solve it the same way as fuse ...

> > Can't you pull readahead_index() out of the ractl ahead of the mutation?
> 
> I'm not sure what you mean by that.  What I'm now doing is:
> 
> 	while ((nr_pages = readahead_count(ractl) - ractl->_batch_count)) {
> 		...
> 		pgoff_t index = readahead_index(ractl) + ractl->_batch_count;
> 		...
> 		rc = cifs_fscache_query_occupancy(
> 			ractl->mapping->host, index, nr_pages,
> 		...
> 		rc = server->ops->wait_mtu_credits(server, cifs_sb->ctx->rsize,
> 						   &rsize, credits);
> 		...
> 		nr_pages = min_t(size_t, rsize / PAGE_SIZE, readahead_count(ractl));
> 		nr_pages = min_t(size_t, nr_pages, next_cached - index);
> 		...
> 		rdata = cifs_readdata_alloc(nr_pages, cifs_readv_complete);
> 		...
> 		got = __readahead_batch(ractl, rdata->pages, nr_pages);
> 		...
> 	}
> 
> I need the count to know how many, if any, pages are remaining; I need the
> count and index of the window to find out if fscache has any data; I need the
> count to allocate a page array.  Only after all that can I crank the next
> batch for the server (assuming I didn't delegate to the cache along the way,
> but that calls readahead_page()).

The problem is that the other users very much want to refer to the
pre-mutation state.  eg, btrfs:

        while ((nr = readahead_page_batch(rac, pagepool))) {
                u64 contig_start = readahead_pos(rac);
                u64 contig_end = contig_start + readahead_batch_length(rac) - 1;

                contiguous_readpages(pagepool, nr, contig_start, contig_end,
                                &em_cached, &bio_ctrl, &prev_em_start);
        }

The API isn't designed to work the way you want it to work.  So either
we redesign it (... and change all the existing users ...) or you use
it the way that FUSE does, which is admittedly suboptimal, but you're
also saying it's temporary.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

