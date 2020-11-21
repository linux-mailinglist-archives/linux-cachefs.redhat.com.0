Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DEF072BBB61
	for <lists+linux-cachefs@lfdr.de>; Sat, 21 Nov 2020 02:03:22 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-2h6zLB64Nkyt3fwsu9nRxg-1; Fri, 20 Nov 2020 20:03:20 -0500
X-MC-Unique: 2h6zLB64Nkyt3fwsu9nRxg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 097B1873088;
	Sat, 21 Nov 2020 01:03:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED30E5C22B;
	Sat, 21 Nov 2020 01:03:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D8CF95002C;
	Sat, 21 Nov 2020 01:03:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AL13FuD004766 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 20:03:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8AD86102044F; Sat, 21 Nov 2020 01:03:15 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 870381018E77
	for <linux-cachefs@redhat.com>; Sat, 21 Nov 2020 01:03:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38C52858EEC
	for <linux-cachefs@redhat.com>; Sat, 21 Nov 2020 01:03:13 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-268-X65guoy5O8eaMoCxPEQiJg-1;
	Fri, 20 Nov 2020 20:03:10 -0500
X-MC-Unique: X65guoy5O8eaMoCxPEQiJg-1
Received: from tleilax.poochiereds.net
	(68-20-15-154.lightspeed.rlghnc.sbcglobal.net [68.20.15.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 09DD220715;
	Sat, 21 Nov 2020 01:03:08 +0000 (UTC)
Message-ID: <5f8e9e0cb53c89a7d1c156a6799c6dbc6db96dae.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: "J. Bruce Fields" <bfields@fieldses.org>
Date: Fri, 20 Nov 2020 20:03:08 -0500
In-Reply-To: <20201120224438.GC7705@fieldses.org>
References: <20201117031601.GB10526@fieldses.org>
	<1605583086-19869-1-git-send-email-bfields@redhat.com>
	<1605583086-19869-2-git-send-email-bfields@redhat.com>
	<a5704a8f7a6ebdfa60d4fa996a4d9ebaacc7daaf.camel@kernel.org>
	<20201117152636.GC4556@fieldses.org>
	<725499c144317aac1a03f0334a22005588dbdefc.camel@kernel.org>
	<20201120223831.GB7705@fieldses.org>
	<20201120224438.GC7705@fieldses.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2020-11-20 at 17:44 -0500, J. Bruce Fields wrote:
> On Fri, Nov 20, 2020 at 05:38:31PM -0500, J. Bruce Fields wrote:
> > On Tue, Nov 17, 2020 at 10:34:57AM -0500, Jeff Layton wrote:
> > > On Tue, 2020-11-17 at 10:26 -0500, J. Bruce Fields wrote:
> > > > On Tue, Nov 17, 2020 at 07:34:49AM -0500, Jeff Layton wrote:
> > > > > I don't think I described what I was thinking well. Let me try again...
> > > > > 
> > > > > There should be no need to change the code in iversion.h -- I think we
> > > > > can do this in a way that's confined to just nfsd/export code.
> > > > > 
> > > > > What I would suggest is to have nfsd4_change_attribute call the
> > > > > fetch_iversion op if it exists, instead of checking IS_I_VERSION and
> > > > > doing the stuff in that block. If fetch_iversion is NULL, then just use
> > > > > the ctime.
> > > > > 
> > > > > Then, you just need to make sure that the filesystems' export_ops have
> > > > > an appropriate fetch_iversion vector. xfs, ext4 and btrfs can just call
> > > > > inode_query_iversion, and NFS and Ceph can call inode_peek_iversion_raw.
> > > > > The rest of the filesystems can leave fetch_iversion as NULL (since we
> > > > > don't want to use it on them).
> > > > 
> > > > Thanks for your patience, that makes sense, I'll try it.
> > > > 
> > > 
> > > There is one gotcha in here though... ext4 needs to also handle the case
> > > where SB_I_VERSION is not set. The simple fix might be to just have
> > > different export ops for ext4 based on whether it was mounted with -o
> > > iversion or not, but maybe there is some better way to do it?
> > 
> > I was thinking ext4's export op could check for I_VERSION on its own and
> > vary behavior based on that.
> > 
> > I'll follow up with new patches in a moment.
> > 
> > I think the first one's all that's needed to fix the problem Daire
> > identified.  I'm a little less sure of the rest.
> > 
> > Lightly tested, just by running them through my usual regression tests
> > (which don't re-export) and then running connectathon on a 4.2 re-export
> > of a 4.2 mount.
> > 
> > The latter triggered a crash preceded by a KASAN use-after free warning.
> > Looks like it might be a problem with blocking lock notifications,
> > probably not related to these patches.
> 

The set looks pretty reasonable at first glance. Nice work.

Once you put this in, I'll plan to add a suitable fetch_iversion op for
ceph too.

> Another nit I ran across:
> 
> Some NFSv4 directory-modifying operations return pre- and post- change
> attributes together with an "atomic" flag that's supposed to indicate
> whether the change attributes were read atomically with the operation.
> It looks like we're setting the atomic flag under the assumptions that
> local vfs locks are sufficient to guarantee atomicity, which isn't right
> when we're exporting a distributed filesystem.
> 
> In the case we're reexporting NFS I guess ideal would be to use the pre-
> and post- attributes that the original server returned and also save
> having to do extra getattr calls.  Not sure how we'd do that,
> though--more export operations?  Maybe for now we could just figure out
> when to turn off the atomic bit.

Oh yeah, good point.

I'm not even sure that local locks are really enough -- IIRC, there are
still some race windows between doing the metadata operations and the
getattrs called to fill pre/post op attrs. Still, those windows are a
lot larger on something like NFS, so setting the flag there is really
stretching things.

One hacky fix might be to add a flags field to export_operations, and
have one that indicates that the atomic flag shouldn't be set. Then we
could add that flag to all of the netfs' (nfs, ceph, cifs), and anywhere
else that we thought it appropriate?

That approach might be helpful later too since we're starting to see a
wider variety of exportable filesystems these days. We may need more
"quirk" flags like this.
-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

