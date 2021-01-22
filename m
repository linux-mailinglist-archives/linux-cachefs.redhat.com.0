Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 65A1430080D
	for <lists+linux-cachefs@lfdr.de>; Fri, 22 Jan 2021 17:01:57 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-EGwIhHUgNqC5LJ6Exrdkkw-1; Fri, 22 Jan 2021 11:01:52 -0500
X-MC-Unique: EGwIhHUgNqC5LJ6Exrdkkw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E77A2801817;
	Fri, 22 Jan 2021 16:01:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34AFA5D6CF;
	Fri, 22 Jan 2021 16:01:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 09FE84BB7B;
	Fri, 22 Jan 2021 16:01:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10MG1ePw000432 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 22 Jan 2021 11:01:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2B0762166B27; Fri, 22 Jan 2021 16:01:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24D222166B32
	for <linux-cachefs@redhat.com>; Fri, 22 Jan 2021 16:01:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DEBB31875049
	for <linux-cachefs@redhat.com>; Fri, 22 Jan 2021 16:01:37 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-394-8gnmbMEzMIqyzSgw-ecbcw-1;
	Fri, 22 Jan 2021 11:01:31 -0500
X-MC-Unique: 8gnmbMEzMIqyzSgw-ecbcw-1
Received: by fieldses.org (Postfix, from userid 2815)
	id 465896EA0; Fri, 22 Jan 2021 11:01:29 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 465896EA0
Date: Fri, 22 Jan 2021 11:01:29 -0500
From: "J. Bruce Fields" <bfields@fieldses.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <20210122160129.GB18583@fieldses.org>
References: <20210121190937.GE20964@fieldses.org>
	<20210121174306.GB20964@fieldses.org>
	<20210121164645.GA20964@fieldses.org>
	<161118128472.1232039.11746799833066425131.stgit@warthog.procyon.org.uk>
	<1794286.1611248577@warthog.procyon.org.uk>
	<1851804.1611255313@warthog.procyon.org.uk>
	<1856291.1611259704@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <1856291.1611259704@warthog.procyon.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 21, 2021 at 08:08:24PM +0000, David Howells wrote:
> J. Bruce Fields <bfields@fieldses.org> wrote:
> > So, I'm still confused: there must be some case where we know fscache
> > actually works reliably and doesn't corrupt your data, right?
> 
> Using ext2/3, for example.  I don't know under what circumstances xfs, ext4
> and btrfs might insert/remove blocks of zeros, but I'm told it can happen.

Do ext2/3 work well for fscache in other ways?

--b.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

