Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A024659FE27
	for <lists+linux-cachefs@lfdr.de>; Wed, 24 Aug 2022 17:22:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661354546;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fdwZSsJOJUUZnI0s6ri+lSL9oIwJ4YioX28G1VGgetg=;
	b=guyRcebCz4QG9yu1Baq+Iu1PQVdD6NjVqltaWbhFbpPhC+lpB5hFsshIQBMHZPhaWixLkq
	JMy4miUuCCSZHhTb2xr1TA1RmYx21Rkdun87bQ5Gsyu+W2+yyTwSBrJjhbBlLDVb1DUd23
	YfkD57OiCa5ZjfSiwp+lBrIsT3S01FA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-goohAcALMJSlHMpOfgmoTg-1; Wed, 24 Aug 2022 11:22:25 -0400
X-MC-Unique: goohAcALMJSlHMpOfgmoTg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B7F518A0758;
	Wed, 24 Aug 2022 15:22:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8B8421121315;
	Wed, 24 Aug 2022 15:22:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6D02A1946A52;
	Wed, 24 Aug 2022 15:22:23 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 11C761946A42 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 24 Aug 2022 14:12:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EA42F2026D07; Wed, 24 Aug 2022 14:12:08 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9F072026D4C;
 Wed, 24 Aug 2022 14:12:07 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <da9200f1bded9b8b078a7aef227fd6b92eb028fb.camel@hammerspace.com>
References: <da9200f1bded9b8b078a7aef227fd6b92eb028fb.camel@hammerspace.com>
 <20220824093501.384755-1-dwysocha@redhat.com>
 <20220824093501.384755-3-dwysocha@redhat.com>
 <429ecc819fcffe63d60dbb2b72f9022d2a21ddd8.camel@hammerspace.com>
 <CALF+zOknvMZyufSUD-g9Z9Y5RfwE-vUFT+CF0kxqbcpR=yJPJw@mail.gmail.com>
To: Trond Myklebust <trondmy@hammerspace.com>
MIME-Version: 1.0
Date: Wed, 24 Aug 2022 15:12:06 +0100
Message-ID: <216681.1661350326@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
 willy@infradead.org, "linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
 "benmaynard@google.com" <benmaynard@google.com>,
 "anna.schumaker@netapp.com" <anna.schumaker@netapp.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <216679.1661350326.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Trond Myklebust <trondmy@hammerspace.com> wrote:

> As long as it is an opt-in feature, I'm OK. I don't want to have to
> compile it in by default.
> A cachefs should never become a mandatory feature of networked
> filesystems.

netfslib is intended to be used even if fsache is not enabled.  It is intended
to make the underlying network filesystem maintainer's life easier by:

 - Moving the implementation of all the VM ops from the network filesystems as
   much as possible into one place.  The network filesystem then just has to
   provide a read op and a write op.

 - Making it such that the filesystem doesn't have to deal with the difference
   between DIO and buffered I/O

 - Handling VM features on behalf of all filesystems.  This gives the VM folk
   one place to change instead of 5+.  mpage and iomap are similar things but
   for blockdev filesystems.

 - Providing features to those filesystems that can support them, eg.:

   - fscrypt
   - compression
   - bounce buffering
   - local caching
   - disconnected operation


Currently nfs interacts with fscache on a page-by-page basis, but this needs
to change:

 (1) Multipage folios are now a thing.  You need to roll folios out into nfs
     if you're going to take advantage of this.  Also, you may have noticed
     that all the VM interfaces are being recast in terms of folios.

 (2) I need to fix the cache so that it no longer uses the backing
     filesystem's metadata to track content.  To make this use less diskspace,
     I want to increase the cache block size to, say, 256K or 2M.

     This means that the cache needs to have a say in how big a read the
     network filesystem does - and also that a single cache request might need
     to be stitched together from multiple read ops.

 (3) More pagecache changes are lurking in the future, possibly including
     getting rid of the concept of pages entirely from the pagecache.

There are users of nfs + fscache and we'd like to continue to support them as
best as possible but the current code noticably degrades performance here.

Unfortunately, I'm also going to need to drop the fallback interface which nfs
currently uses in the next couple versions, we have to at least get the
fscache enabled conversion done.

I've been dealing with the VM, 9p, ceph and cifs people over the direction
that netfslib might need to go in, but for nfs, it's typically been a flat
"no".  I would like to work out how to make netfslib work for nfs also, if
you're willing to discuss it.

I would be open to having a look at importing nfs page handling into netfslib
and working from that - but it still needs to deal with (1) and (2) above, and
I would like to make it pass iterators down to the lower layers as buffer
descriptions.  It's also very complicated stuff.

Also:

 - I've noted the nfs_page structs that nfs uses and I'm looking at a way of
   having something similar, but held separately so that one struct can span
   and store information about multiple folios.

 - I'm looking at punting write-to-the-cache to writepages() or something like
   that so that the VM folks can reclaim the PG_private_2 flag bit, so that
   won't be available to nfs either in the future.

 - aops->write_begin() and ->write_end() are going to go away.  In netfslib
   what I'm trying to do is make a "netfs_perform_write" as a parallel to
   generic_perform_write().

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

