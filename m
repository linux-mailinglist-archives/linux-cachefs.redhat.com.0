Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB645A1502
	for <lists+linux-cachefs@lfdr.de>; Thu, 25 Aug 2022 17:01:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661439706;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hM7j3GZU93LFt24Oq13DY2G+D7gEeEg1G12NP7PSk3g=;
	b=fCmLilE23g6IRkguGyvaK/1UXy1+kgH33MPkrI5imkjS18SHEjR2j6jffsba3LGgZHktrR
	M7psVqxpSEqnd04yP6WrYxhS48MOhCFtop44n5Ip8DP/QHhnFMxwjd/rZ61tllG3sooeuM
	/SbB8aAicLUjJw98YfmDzy4Yx1TjLGQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-69zX1xP5NTKyDe9R-CK5Lw-1; Thu, 25 Aug 2022 11:01:44 -0400
X-MC-Unique: 69zX1xP5NTKyDe9R-CK5Lw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A091811E9B;
	Thu, 25 Aug 2022 15:01:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 682EC492C3B;
	Thu, 25 Aug 2022 15:01:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 790221946A5E;
	Thu, 25 Aug 2022 15:01:38 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C79271946A43 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 25 Aug 2022 15:01:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7E432492CA5; Thu, 25 Aug 2022 15:01:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A509492C3B
 for <linux-cachefs@redhat.com>; Thu, 25 Aug 2022 15:01:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63187101E989
 for <linux-cachefs@redhat.com>; Thu, 25 Aug 2022 15:01:36 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-206-297KlNlUP46tpfQ3rjUcWQ-1; Thu,
 25 Aug 2022 11:01:31 -0400
X-MC-Unique: 297KlNlUP46tpfQ3rjUcWQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oREML-00HKgV-7u; Thu, 25 Aug 2022 15:01:29 +0000
Date: Thu, 25 Aug 2022 16:01:29 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Trond Myklebust <trondmy@hammerspace.com>
Message-ID: <YweOySTkKQ3PDLCv@casper.infradead.org>
References: <da9200f1bded9b8b078a7aef227fd6b92eb028fb.camel@hammerspace.com>
 <20220824093501.384755-1-dwysocha@redhat.com>
 <20220824093501.384755-3-dwysocha@redhat.com>
 <429ecc819fcffe63d60dbb2b72f9022d2a21ddd8.camel@hammerspace.com>
 <CALF+zOknvMZyufSUD-g9Z9Y5RfwE-vUFT+CF0kxqbcpR=yJPJw@mail.gmail.com>
 <216681.1661350326@warthog.procyon.org.uk>
 <5ab3188affa7e56e68a4f66a42f45d7086c1da23.camel@hammerspace.com>
 <YwZXfSXMzZgaSPAg@casper.infradead.org>
 <5dfadceb26da1b4d8d499221a5ff1d3c80ad59c0.camel@hammerspace.com>
MIME-Version: 1.0
In-Reply-To: <5dfadceb26da1b4d8d499221a5ff1d3c80ad59c0.camel@hammerspace.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [Linux-cachefs] [RFC PATCH 2/3] NFS: Add support for netfs in
 struct nfs_inode and Kconfig
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
 "benmaynard@google.com" <benmaynard@google.com>,
 "anna.schumaker@netapp.com" <anna.schumaker@netapp.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2022 at 05:43:36PM +0000, Trond Myklebust wrote:
> On Wed, 2022-08-24 at 17:53 +0100, Matthew Wilcox wrote:
> > On Wed, Aug 24, 2022 at 04:27:04PM +0000, Trond Myklebust wrote:
> > > Right now, I see limited value in adding multipage folios to NFS.
> > >=20
> > > While basic NFSv4 does allow you to pretend there is a fundamental
> > > underlying block size, pNFS has changed all that, and we have had
> > > to
> > > engineer support for determining the I/O block size on the fly, and
> > > building the RPC requests accordingly. Client side mirroring just
> > > adds
> > > to the fun.
> > >=20
> > > As I see it, the only value that multipage folios might bring to
> > > NFS
> > > would be smaller page cache management overhead when dealing with
> > > large
> > > files.
> >=20
> > Yes, but that's a Really Big Deal.=A0 Machines with a lot of memory end
> > up with very long LRU lists.=A0 We can't afford the overhead of
> > managing
> > memory in 4kB chunks any more.=A0 (I don't want to dwell on this point
> > too
> > much; I've run the numbers before and can do so again if you want me
> > to
> > go into more details).
> >=20
> > Beyond that, filesystems have a lot of interactions with the page
> > cache
> > today.=A0 When I started looking at this, I thought filesystem people
> > all
> > had a deep understanding of how the page cache worked.=A0 Now I realise
> > everyone's as clueless as I am.=A0 The real benefit I see to projects
> > like
> > iomap/netfs is that they insulate filesystems from having to deal
> > with
> > the page cache.=A0 All the interactions are in two or three places and
> > we
> > can refactor without having to talk to the owners of 50+ filesystems.
> >=20
> > It also gives us a chance to re-examine some of the assumptions that
> > we have made over the years about how filesystems and page cache
> > should
> > be interacting.=A0 We've fixed a fair few bugs in recent years that
> > came
> > about because filesystem people don't tend to have deep knowledge of
> > mm
> > internals (and they shouldn't need to!)
> >=20
> > I don't know that netfs has the perfect interface to be used for nfs.
> > But that too can be changed to make it work better for your needs.
>=20
> If the VM folks need it, then adding support for multi-page folios is a
> much smaller scope than what David was describing. It can be done
> without too much surgery to the existing NFS I/O stack. We already have
> code to support I/O block sizes that are much less than the page size,
> so converting that to act on larger folios is not a huge deal.
>=20
> What would be useful there is something like a range tree to allow us
> to move beyond the PG_uptodate bit, and help make the
> is_partially_uptodate() address_space_operation a bit more useful.
> Otherwise, we end up having to read in the entire folio, which is what
> we do today for pages, but could get onerous with large folios when
> doing file random access.

This is interesting because nobody's asked for this before.  I've had
similar discussions around dirty data tracking, but not around uptodate.
Random small reads shouldn't be a terrible problem; if they truly are
random, we behave as today, allocating single pages, reading the entire
page from the server and setting it uptodate.  If the readahead code
detects a contiguous large read, we increase the allocation size to
match, but again we always read the entire folio from the server and
mark it uptodate.

As far as I know, the only time we create !uptodate folios in the page
cache is partial writes to a folio which has not been previously read.
Obviously, those bytes start out dirty and are tracked through the
existing dirty mechanism, but once they've been written back, we have
three choices that I can see:

1. transition those bytes to a mechanism which records they're uptodate
2. discard that information and re-read the entire folio from the server
   if any bytes are subsequently read
3. read the other bytes in that folio from the server and mark the
   entire folio uptodate

We have a mixture of those options implemented in different filesystems
today.  iomap records whether a block is uptodate or not and treats
every uptodate block as dirty if any block in the folio is dirty.
buffer_head has two bits for each block, separately recording whether
it's dirty and/or uptodate.  AFS tracks one dirty range per folio, but
it first brings the folio uptodate by reading it from the server before
overwriting it (I suppose that's a fourth option).

I don't see a compelling reason for different filesystems to behave
differently here.  I'd like us to settle on one design we can all share,
and I was hoping netfs would be the platform for that.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

