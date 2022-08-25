Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B40535A1579
	for <lists+linux-cachefs@lfdr.de>; Thu, 25 Aug 2022 17:20:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661440823;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6DIIPbRb8jNQN4BTKYoQLzesu+uzZpu6Iw7pYnfsXMo=;
	b=bGcrC1ob4gR4j1tHB59SJlU3Uzfl3hjhFZNs28T7oOGTqlcAaHHKWgLuiGWb8up+NmqjxT
	3j0AYb7WvtBwnbhlVgTPim6dg5ydxH01VXf3IlYiI8JFGxOAbux9yG7qUM8FQdgozj75J+
	zC3PD3r/kqTY20L4Ylqa3UdRg69Kcjs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-888XbpGiOgWn48SCmA0SYg-1; Thu, 25 Aug 2022 11:20:22 -0400
X-MC-Unique: 888XbpGiOgWn48SCmA0SYg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 44853101A54E;
	Thu, 25 Aug 2022 15:20:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3AE092166B26;
	Thu, 25 Aug 2022 15:20:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 25B991946A5E;
	Thu, 25 Aug 2022 15:20:19 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CE5951946A43 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 25 Aug 2022 15:20:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 86D29C15BC3; Thu, 25 Aug 2022 15:20:17 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 61873C15BBA;
 Thu, 25 Aug 2022 15:20:16 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <5ab3188affa7e56e68a4f66a42f45d7086c1da23.camel@hammerspace.com>
References: <5ab3188affa7e56e68a4f66a42f45d7086c1da23.camel@hammerspace.com>
 <da9200f1bded9b8b078a7aef227fd6b92eb028fb.camel@hammerspace.com>
 <20220824093501.384755-1-dwysocha@redhat.com>
 <20220824093501.384755-3-dwysocha@redhat.com>
 <429ecc819fcffe63d60dbb2b72f9022d2a21ddd8.camel@hammerspace.com>
 <CALF+zOknvMZyufSUD-g9Z9Y5RfwE-vUFT+CF0kxqbcpR=yJPJw@mail.gmail.com>
 <216681.1661350326@warthog.procyon.org.uk>
To: Trond Myklebust <trondmy@hammerspace.com>
MIME-Version: 1.0
Date: Thu, 25 Aug 2022 16:20:15 +0100
Message-ID: <3931441.1661440815@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
 "willy@infradead.org" <willy@infradead.org>,
 "linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
 "benmaynard@google.com" <benmaynard@google.com>,
 "anna.schumaker@netapp.com" <anna.schumaker@netapp.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <3931440.1661440815.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Trond Myklebust <trondmy@hammerspace.com> wrote:

> While basic NFSv4 does allow you to pretend there is a fundamental
> underlying block size, pNFS has changed all that, and we have had to
> engineer support for determining the I/O block size on the fly, and
> building the RPC requests accordingly. Client side mirroring just adds
> to the fun.

I've been working with Jeff to make netfslib handle ceph with its distributed
object model as well as 9p and afs with their more traditionally-appearing
flat files.

> However let's start with the "why?" question first. Why do I need an
> extra layer of abstraction between NFS and the VM, when one of my
> primary concerns right now is that the stack depth keeps growing?

It's not exactly an extra layer - it's more a case of taking the same layer
out of five[*] network filesystems, combining them and sharing it.

[*] up to 7 if I can roll it out into orangefs and/or fuse as well.

As to why, well I kind of covered that, but we want to add some services to
network filesystems (such as content encryption) and rather than adding
separately to all five, there exists the possibility of just doing it the once
and sharing it (granted there may be parts that can't be shared).

But also, I need to fix cachefiles - and I can't do that whilst nfs is
operating on a page-by-page basis.  Cachefiles has to have an early say on the
size and shape of a transaction.

And speaking of content encryption, if you're using a local cache and content
encryption, you really don't want the unencrypted data to be stored in your
local cache on your laptop, say - so that requires storage of the encrypted
data into the cache.

Further, the VM folks would like the PG_private_2 bit back, along with
PG_checked and PG_error.  So we need a different way of managing writes to the
cache and preventing overlapping DIO writes.

> What problems would any of this solve for NFS? I'm worried about the
> cost of all this proposed code churn as well; as you said 'it is
> complicated stuff', mainly for the good reason that we've been
> optimising a lot of code over the last 25-30 years.

First off, NFS would get to partake of services being implemented in netfslib.
Granted, this isn't exactly solving problems in NFS, more providing additional
features.

Secondly, shared code means less code - and the code would, in theory, be
better-tested as it would have more users.

Thirdly, it would hopefully reduce the maintenance burden, particularly for
the VM people.

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

