Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 732D55A012A
	for <lists+linux-cachefs@lfdr.de>; Wed, 24 Aug 2022 20:12:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661364775;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xU4Duyqv5fsdlTT+x/YxZ5bFaFdAQgQObBFy8WBh3QE=;
	b=bTY63NSQgONiSwN9sTSMlwg4xjsHs8yhNdViyY1/XpLisg48IrQzpI+Y16xqcbchrMGRvQ
	G37WGe4BAgOVFh2mZT8/yJRuzqh5ZsoX1WpewpKUBG5aBpdYSkYLiU2losZ5LFOJZnEsf4
	5EOCg7o2rvqAEyI9bzKkSwsBDz1RAb8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-yAKIH-MMP4GKZ02nlbgN7Q-1; Wed, 24 Aug 2022 14:12:51 -0400
X-MC-Unique: yAKIH-MMP4GKZ02nlbgN7Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AF2C85A58B;
	Wed, 24 Aug 2022 18:12:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 55AA91121319;
	Wed, 24 Aug 2022 18:12:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D3D841946A5A;
	Wed, 24 Aug 2022 18:12:49 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0D6DC1946A42 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 24 Aug 2022 17:17:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DB5F84010D24; Wed, 24 Aug 2022 17:17:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D7A3240C141D
 for <linux-cachefs@redhat.com>; Wed, 24 Aug 2022 17:17:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0CD3185A7BA
 for <linux-cachefs@redhat.com>; Wed, 24 Aug 2022 17:17:44 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-657-MADoq4ZPOSeMoVqbhxuiyg-1; Wed,
 24 Aug 2022 13:17:43 -0400
X-MC-Unique: MADoq4ZPOSeMoVqbhxuiyg-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oQtcz-00GVDg-Qv; Wed, 24 Aug 2022 16:53:17 +0000
Date: Wed, 24 Aug 2022 17:53:17 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Trond Myklebust <trondmy@hammerspace.com>
Message-ID: <YwZXfSXMzZgaSPAg@casper.infradead.org>
References: <da9200f1bded9b8b078a7aef227fd6b92eb028fb.camel@hammerspace.com>
 <20220824093501.384755-1-dwysocha@redhat.com>
 <20220824093501.384755-3-dwysocha@redhat.com>
 <429ecc819fcffe63d60dbb2b72f9022d2a21ddd8.camel@hammerspace.com>
 <CALF+zOknvMZyufSUD-g9Z9Y5RfwE-vUFT+CF0kxqbcpR=yJPJw@mail.gmail.com>
 <216681.1661350326@warthog.procyon.org.uk>
 <5ab3188affa7e56e68a4f66a42f45d7086c1da23.camel@hammerspace.com>
MIME-Version: 1.0
In-Reply-To: <5ab3188affa7e56e68a4f66a42f45d7086c1da23.camel@hammerspace.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 24, 2022 at 04:27:04PM +0000, Trond Myklebust wrote:
> Right now, I see limited value in adding multipage folios to NFS.
> 
> While basic NFSv4 does allow you to pretend there is a fundamental
> underlying block size, pNFS has changed all that, and we have had to
> engineer support for determining the I/O block size on the fly, and
> building the RPC requests accordingly. Client side mirroring just adds
> to the fun.
> 
> As I see it, the only value that multipage folios might bring to NFS
> would be smaller page cache management overhead when dealing with large
> files.

Yes, but that's a Really Big Deal.  Machines with a lot of memory end
up with very long LRU lists.  We can't afford the overhead of managing
memory in 4kB chunks any more.  (I don't want to dwell on this point too
much; I've run the numbers before and can do so again if you want me to
go into more details).

Beyond that, filesystems have a lot of interactions with the page cache
today.  When I started looking at this, I thought filesystem people all
had a deep understanding of how the page cache worked.  Now I realise
everyone's as clueless as I am.  The real benefit I see to projects like
iomap/netfs is that they insulate filesystems from having to deal with
the page cache.  All the interactions are in two or three places and we
can refactor without having to talk to the owners of 50+ filesystems.

It also gives us a chance to re-examine some of the assumptions that
we have made over the years about how filesystems and page cache should
be interacting.  We've fixed a fair few bugs in recent years that came
about because filesystem people don't tend to have deep knowledge of mm
internals (and they shouldn't need to!)

I don't know that netfs has the perfect interface to be used for nfs.
But that too can be changed to make it work better for your needs.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

