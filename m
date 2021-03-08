Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D5FD63316F5
	for <lists+linux-cachefs@lfdr.de>; Mon,  8 Mar 2021 20:09:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615230548;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fCGscRPmc8912xEMsBrr9n4eFdai50fWculV2ZSR+Rw=;
	b=Yf/0J9wTksmBNgo/o8yHRd8dvy1P63IITcVi0dAj/vlSOmkLU70MnZfjqoD3/R8aowFoAq
	A/IsWbMzvEaVrgjSIZeqluIDAbIlcDhbh5Vhd2qqXdECiUVRftFiSVf4QBZV9+Gek1wmsS
	9R//YfEFRUhkLe1HMTHl42Oog8p4mIQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-x055qCDTMQODfRPKZBzM8w-1; Mon, 08 Mar 2021 14:09:06 -0500
X-MC-Unique: x055qCDTMQODfRPKZBzM8w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1D0D1005582;
	Mon,  8 Mar 2021 19:09:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CEF8A1037E83;
	Mon,  8 Mar 2021 19:09:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B0DC14EA32;
	Mon,  8 Mar 2021 19:09:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 128J8xr2004771 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 8 Mar 2021 14:08:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E562F3CC5; Mon,  8 Mar 2021 19:08:59 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-118-152.rdu2.redhat.com
	[10.10.118.152])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9B45F19C79;
	Mon,  8 Mar 2021 19:08:53 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20210308185410.GE7284@fieldses.org>
References: <20210308185410.GE7284@fieldses.org>
	<CAOQ4uxhxwKHLT559f8v5aFTheKgPUndzGufg0E58rkEqa9oQ3Q@mail.gmail.com>
	<2653261.1614813611@warthog.procyon.org.uk>
	<517184.1615194835@warthog.procyon.org.uk>
To: "J. Bruce Fields" <bfields@fieldses.org>
MIME-Version: 1.0
Date: Mon, 08 Mar 2021 19:08:52 +0000
Message-ID: <19639.1615230532@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 128J8xr2004771
X-loop: linux-cachefs@redhat.com
Cc: Christoph Hellwig <hch@infradead.org>,
	Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
	CIFS <linux-cifs@vger.kernel.org>, Amir Goldstein <amir73il@gmail.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	Miklos Szeredi <miklos@szeredi.hu>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Dave Chinner <dchinner@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net,
	ceph-devel <ceph-devel@vger.kernel.org>, linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] fscache: Redesigning the on-disk cache
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
Content-ID: <19638.1615230532.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

J. Bruce Fields <bfields@fieldses.org> wrote:

> On Mon, Mar 08, 2021 at 09:13:55AM +0000, David Howells wrote:
> > Amir Goldstein <amir73il@gmail.com> wrote:
> > > With ->fiemap() you can at least make the distinction between a non existing
> > > and an UNWRITTEN extent.
> > 
> > I can't use that for XFS, Ext4 or btrfs, I suspect.  Christoph and Dave's
> > assertion is that the cache can't rely on the backing filesystem's metadata
> > because these can arbitrarily insert or remove blocks of zeros to bridge or
> > split extents.
> 
> Could you instead make some sort of explicit contract with the
> filesystem?  Maybe you'd flag it at mkfs time and query for it before
> allowing a filesystem to be used for fscache.  You don't need every
> filesystem to support fscache, right, just one acceptable one?

I've asked about that, but the filesystem maintainers are reluctant to do
that.

Something might be possible in ext4 using direct access to jbd2, though I
don't know exactly what facilities that offers.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

