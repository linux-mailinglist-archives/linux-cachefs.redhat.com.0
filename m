Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7F2DC2FF237
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Jan 2021 18:43:35 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-_GNN5FdpOeeQgLfFNAwHWQ-1; Thu, 21 Jan 2021 12:43:32 -0500
X-MC-Unique: _GNN5FdpOeeQgLfFNAwHWQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1C061009456;
	Thu, 21 Jan 2021 17:43:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C81BC1002382;
	Thu, 21 Jan 2021 17:43:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA57C18095C7;
	Thu, 21 Jan 2021 17:43:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10LHhM0G007261 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 21 Jan 2021 12:43:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EE63D2026D3C; Thu, 21 Jan 2021 17:43:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E96102026D3A
	for <linux-cachefs@redhat.com>; Thu, 21 Jan 2021 17:43:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A544A858280
	for <linux-cachefs@redhat.com>; Thu, 21 Jan 2021 17:43:19 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-4-jRHyTXpRNqqjXWkPMr1z_A-1;
	Thu, 21 Jan 2021 12:43:12 -0500
X-MC-Unique: jRHyTXpRNqqjXWkPMr1z_A-1
Received: by fieldses.org (Postfix, from userid 2815)
	id 76FF46E97; Thu, 21 Jan 2021 12:43:06 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 76FF46E97
Date: Thu, 21 Jan 2021 12:43:06 -0500
From: "J. Bruce Fields" <bfields@fieldses.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <20210121174306.GB20964@fieldses.org>
References: <20210121164645.GA20964@fieldses.org>
	<161118128472.1232039.11746799833066425131.stgit@warthog.procyon.org.uk>
	<1794286.1611248577@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <1794286.1611248577@warthog.procyon.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>, Dominique Martinet <asmadeus@codewreck.org>,
	linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [RFC][PATCH 00/25] Network fs helper library &
	fscache kiocb API
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 21, 2021 at 05:02:57PM +0000, David Howells wrote:
> J. Bruce Fields <bfields@fieldses.org> wrote:
> 
> > On Wed, Jan 20, 2021 at 10:21:24PM +0000, David Howells wrote:
> > >      Note that this uses SEEK_HOLE/SEEK_DATA to locate the data available
> > >      to be read from the cache.  Whilst this is an improvement from the
> > >      bmap interface, it still has a problem with regard to a modern
> > >      extent-based filesystem inserting or removing bridging blocks of
> > >      zeros.
> > 
> > What are the consequences from the point of view of a user?
> 
> The cache can get both false positive and false negative results on checks for
> the presence of data because an extent-based filesystem can, at will, insert
> or remove blocks of contiguous zeros to make the extents easier to encode
> (ie. bridge them or split them).
> 
> A false-positive means that you get a block of zeros in the middle of your
> file that very probably shouldn't be there (ie. file corruption); a
> false-negative means that we go and reload the missing chunk from the server.
> 
> The problem exists in cachefiles whether we use bmap or we use
> SEEK_HOLE/SEEK_DATA.  The only way round it is to keep track of what data is
> present independently of backing filesystem's metadata.
> 
> To this end, it shouldn't (mis)behave differently than the code already there
> - except that it handles better the case in which the backing filesystem
> blocksize != PAGE_SIZE (which may not be relevant on an extent-based
> filesystem anyway if it packs parts of different files together in a single
> block) because the current implementation only bmaps the first block in a page
> and doesn't probe for the rest.
> 
> Fixing this requires a much bigger overhaul of cachefiles than this patchset
> performs.

That sounds like "sometimes you may get file corruption and there's
nothing you can do about it".  But I know people actually use fscache,
so it must be reliable at least for some use cases.

Is it that those "bridging" blocks only show up in certain corner cases
that users can arrange to avoid?  Or that it's OK as long as you use
certain specific file systems whose behavior goes beyond what's
technically required by the bamp or seek interfaces?

--b.

> 
> Also, it works towards getting rid of this use of bmap, but that's not user
> visible.
> 
> David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

