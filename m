Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id F09642B51D0
	for <lists+linux-cachefs@lfdr.de>; Mon, 16 Nov 2020 21:03:34 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-qra5hYdoOSGSGvzr9aMSsQ-1; Mon, 16 Nov 2020 15:03:31 -0500
X-MC-Unique: qra5hYdoOSGSGvzr9aMSsQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25071100747C;
	Mon, 16 Nov 2020 20:03:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5C8C5D9CC;
	Mon, 16 Nov 2020 20:03:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 201B1183D021;
	Mon, 16 Nov 2020 20:03:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AGK3PeE021433 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 16 Nov 2020 15:03:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1A4782166B44; Mon, 16 Nov 2020 20:03:25 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 15B2B2166B27
	for <linux-cachefs@redhat.com>; Mon, 16 Nov 2020 20:03:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1456811E82
	for <linux-cachefs@redhat.com>; Mon, 16 Nov 2020 20:03:22 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-486-9tLUXc3tOMeO56GHafEJPA-1;
	Mon, 16 Nov 2020 15:03:19 -0500
X-MC-Unique: 9tLUXc3tOMeO56GHafEJPA-1
Received: from tleilax.poochiereds.net
	(68-20-15-154.lightspeed.rlghnc.sbcglobal.net [68.20.15.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 229F320A8B;
	Mon, 16 Nov 2020 20:03:17 +0000 (UTC)
Message-ID: <0047077b3bd79a96589626ba154e6d9e95a35478.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: bfields <bfields@fieldses.org>
Date: Mon, 16 Nov 2020 15:03:15 -0500
In-Reply-To: <20201116190336.GH898@fieldses.org>
References: <444227972.86442677.1605206025305.JavaMail.zimbra@dneg.com>
	<20201112205524.GI9243@fieldses.org>
	<883314904.86570901.1605222357023.JavaMail.zimbra@dneg.com>
	<20201113145050.GB1299@fieldses.org>
	<20201113222600.GC1299@fieldses.org>
	<b0d61b4053442ba46fd2c707ee7e0608704c2598.camel@kernel.org>
	<20201116155619.GF898@fieldses.org>
	<83ebb6dc68216ce3f3dfd2a2736b7a301550efc5.camel@kernel.org>
	<20201116161407.GG898@fieldses.org>
	<db55bab87b6fc9dd1594f8c2e853f07b1165ff5d.camel@kernel.org>
	<20201116190336.GH898@fieldses.org>
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
	linux-nfs <linux-nfs@vger.kernel.org>,
	Trond Myklebust <trondmy@hammerspace.com>
Subject: Re: [Linux-cachefs] Adventures in NFS re-exporting
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2020-11-16 at 14:03 -0500, bfields wrote:
> On Mon, Nov 16, 2020 at 11:38:44AM -0500, Jeff Layton wrote:
> > Hmm, ok... nfsd4_change_attribute() is called from nfs4 code but also
> > nfs3 code as well. The v4 caller (encode_change) only calls it when
> > IS_I_VERSION is set, but the v3 callers don't seem to pay attention to
> > that.
> 
> Weird.  Looking back....  That goes back to the original patch adding
> support for ext4's i_version, c654b8a9cba6 "nfsd: support ext4
> i_version".
> 
> It's in nfs3xdr.c, but the fields it's filling in, fh_pre_change and
> fh_post_change, are only used in nfs4xdr.c.  Maybe moving it someplace
> else (vfs.c?) would save some confusion.
> 
> Anyway, yes, that should be checking SB_I_VERSION too.
> 
> > I think the basic issue here is that we're trying to use SB_I_VERSION
> > for two different things. Its main purpose is to tell the kernel that
> > when it's updating the file times that it should also (possibly)
> > increment the i_version counter too. (Some of this is documented in
> > include/linux/iversion.h too, fwiw)
> > 
> > nfsd needs a way to tell whether the field should be consulted at all.
> > For that we probably do need a different flag of some sort. Doing it at
> > the fstype level seems a bit wrong though -- v2/3 don't have a real
> > change attribute and it probably shouldn't be trusted when exporting
> > them.
> 
> Oops, good point.
> 
> I suppose simplest is just another SB_ flag.
> 

Another idea might be to add a new fetch_iversion export operation that
returns a u64. Roll two generic functions -- one to handle the
xfs/ext4/btrfs case and another for the NFS/AFS/Ceph case (where we just
fetch it raw). When the op is a NULL pointer, treat it like the
!IS_I_VERSION case today.

-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

