Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9BB0E2BB94A
	for <lists+linux-cachefs@lfdr.de>; Fri, 20 Nov 2020 23:44:53 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-yiieBqsRNaKKHufTd4hqAg-1; Fri, 20 Nov 2020 17:44:50 -0500
X-MC-Unique: yiieBqsRNaKKHufTd4hqAg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7EA01107AD34;
	Fri, 20 Nov 2020 22:44:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B8785D6AD;
	Fri, 20 Nov 2020 22:44:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D7C65180954D;
	Fri, 20 Nov 2020 22:44:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AKMijkE019591 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 17:44:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 88CC2115D355; Fri, 20 Nov 2020 22:44:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 84806115D354
	for <linux-cachefs@redhat.com>; Fri, 20 Nov 2020 22:44:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C9C2185A7BC
	for <linux-cachefs@redhat.com>; Fri, 20 Nov 2020 22:44:43 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-513-_FkxUlC-PFCasULVG6jd_w-1;
	Fri, 20 Nov 2020 17:44:39 -0500
X-MC-Unique: _FkxUlC-PFCasULVG6jd_w-1
Received: by fieldses.org (Postfix, from userid 2815)
	id 44A836E9D; Fri, 20 Nov 2020 17:44:38 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 44A836E9D
Date: Fri, 20 Nov 2020 17:44:38 -0500
From: "J. Bruce Fields" <bfields@fieldses.org>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20201120224438.GC7705@fieldses.org>
References: <20201117031601.GB10526@fieldses.org>
	<1605583086-19869-1-git-send-email-bfields@redhat.com>
	<1605583086-19869-2-git-send-email-bfields@redhat.com>
	<a5704a8f7a6ebdfa60d4fa996a4d9ebaacc7daaf.camel@kernel.org>
	<20201117152636.GC4556@fieldses.org>
	<725499c144317aac1a03f0334a22005588dbdefc.camel@kernel.org>
	<20201120223831.GB7705@fieldses.org>
MIME-Version: 1.0
In-Reply-To: <20201120223831.GB7705@fieldses.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 20, 2020 at 05:38:31PM -0500, J. Bruce Fields wrote:
> On Tue, Nov 17, 2020 at 10:34:57AM -0500, Jeff Layton wrote:
> > On Tue, 2020-11-17 at 10:26 -0500, J. Bruce Fields wrote:
> > > On Tue, Nov 17, 2020 at 07:34:49AM -0500, Jeff Layton wrote:
> > > > I don't think I described what I was thinking well. Let me try again...
> > > > 
> > > > There should be no need to change the code in iversion.h -- I think we
> > > > can do this in a way that's confined to just nfsd/export code.
> > > > 
> > > > What I would suggest is to have nfsd4_change_attribute call the
> > > > fetch_iversion op if it exists, instead of checking IS_I_VERSION and
> > > > doing the stuff in that block. If fetch_iversion is NULL, then just use
> > > > the ctime.
> > > > 
> > > > Then, you just need to make sure that the filesystems' export_ops have
> > > > an appropriate fetch_iversion vector. xfs, ext4 and btrfs can just call
> > > > inode_query_iversion, and NFS and Ceph can call inode_peek_iversion_raw.
> > > > The rest of the filesystems can leave fetch_iversion as NULL (since we
> > > > don't want to use it on them).
> > > 
> > > Thanks for your patience, that makes sense, I'll try it.
> > > 
> > 
> > There is one gotcha in here though... ext4 needs to also handle the case
> > where SB_I_VERSION is not set. The simple fix might be to just have
> > different export ops for ext4 based on whether it was mounted with -o
> > iversion or not, but maybe there is some better way to do it?
> 
> I was thinking ext4's export op could check for I_VERSION on its own and
> vary behavior based on that.
> 
> I'll follow up with new patches in a moment.
> 
> I think the first one's all that's needed to fix the problem Daire
> identified.  I'm a little less sure of the rest.
> 
> Lightly tested, just by running them through my usual regression tests
> (which don't re-export) and then running connectathon on a 4.2 re-export
> of a 4.2 mount.
> 
> The latter triggered a crash preceded by a KASAN use-after free warning.
> Looks like it might be a problem with blocking lock notifications,
> probably not related to these patches.

Another nit I ran across:

Some NFSv4 directory-modifying operations return pre- and post- change
attributes together with an "atomic" flag that's supposed to indicate
whether the change attributes were read atomically with the operation.
It looks like we're setting the atomic flag under the assumptions that
local vfs locks are sufficient to guarantee atomicity, which isn't right
when we're exporting a distributed filesystem.

In the case we're reexporting NFS I guess ideal would be to use the pre-
and post- attributes that the original server returned and also save
having to do extra getattr calls.  Not sure how we'd do that,
though--more export operations?  Maybe for now we could just figure out
when to turn off the atomic bit.

--b.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

