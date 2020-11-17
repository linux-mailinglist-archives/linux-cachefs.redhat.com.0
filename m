Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0598C2B6ABF
	for <lists+linux-cachefs@lfdr.de>; Tue, 17 Nov 2020 17:56:35 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-vmPvTF1lP6CRJGa8iCYwIw-1; Tue, 17 Nov 2020 11:56:33 -0500
X-MC-Unique: vmPvTF1lP6CRJGa8iCYwIw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D63F785C731;
	Tue, 17 Nov 2020 16:56:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C319410013D0;
	Tue, 17 Nov 2020 16:56:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AB0E058135;
	Tue, 17 Nov 2020 16:56:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AHFZ8Ec022132 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 17 Nov 2020 10:35:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AD7FB2166BA2; Tue, 17 Nov 2020 15:35:08 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A797E2166BA0
	for <linux-cachefs@redhat.com>; Tue, 17 Nov 2020 15:35:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 428E785829F
	for <linux-cachefs@redhat.com>; Tue, 17 Nov 2020 15:35:06 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-35-4fcW5wkTPFWk5No-NF9mYg-1; 
	Tue, 17 Nov 2020 10:35:00 -0500
X-MC-Unique: 4fcW5wkTPFWk5No-NF9mYg-1
Received: from tleilax.poochiereds.net
	(68-20-15-154.lightspeed.rlghnc.sbcglobal.net [68.20.15.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 3AD312222A;
	Tue, 17 Nov 2020 15:34:58 +0000 (UTC)
Message-ID: <725499c144317aac1a03f0334a22005588dbdefc.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: "J. Bruce Fields" <bfields@fieldses.org>
Date: Tue, 17 Nov 2020 10:34:57 -0500
In-Reply-To: <20201117152636.GC4556@fieldses.org>
References: <20201117031601.GB10526@fieldses.org>
	<1605583086-19869-1-git-send-email-bfields@redhat.com>
	<1605583086-19869-2-git-send-email-bfields@redhat.com>
	<a5704a8f7a6ebdfa60d4fa996a4d9ebaacc7daaf.camel@kernel.org>
	<20201117152636.GC4556@fieldses.org>
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33)
MIME-Version: 1.0
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
Cc: Daire Byrne <daire@dneg.com>, linux-cachefs <linux-cachefs@redhat.com>,
	"J. Bruce Fields" <bfields@redhat.com>,
	linux-nfs <linux-nfs@vger.kernel.org>,
	Trond Myklebust <trondmy@hammerspace.com>
Subject: Re: [Linux-cachefs] [PATCH 2/4] nfsd: pre/post attr is using wrong
	change attribute
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2020-11-17 at 10:26 -0500, J. Bruce Fields wrote:
> On Tue, Nov 17, 2020 at 07:34:49AM -0500, Jeff Layton wrote:
> > I don't think I described what I was thinking well. Let me try again...
> > 
> > There should be no need to change the code in iversion.h -- I think we
> > can do this in a way that's confined to just nfsd/export code.
> > 
> > What I would suggest is to have nfsd4_change_attribute call the
> > fetch_iversion op if it exists, instead of checking IS_I_VERSION and
> > doing the stuff in that block. If fetch_iversion is NULL, then just use
> > the ctime.
> > 
> > Then, you just need to make sure that the filesystems' export_ops have
> > an appropriate fetch_iversion vector. xfs, ext4 and btrfs can just call
> > inode_query_iversion, and NFS and Ceph can call inode_peek_iversion_raw.
> > The rest of the filesystems can leave fetch_iversion as NULL (since we
> > don't want to use it on them).
> 
> Thanks for your patience, that makes sense, I'll try it.
> 

There is one gotcha in here though... ext4 needs to also handle the case
where SB_I_VERSION is not set. The simple fix might be to just have
different export ops for ext4 based on whether it was mounted with -o
iversion or not, but maybe there is some better way to do it?

-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

