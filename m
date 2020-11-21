Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 70ED82BC249
	for <lists+linux-cachefs@lfdr.de>; Sat, 21 Nov 2020 22:44:52 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-RPninxKiPFKEMThGM6XRnw-1; Sat, 21 Nov 2020 16:44:49 -0500
X-MC-Unique: RPninxKiPFKEMThGM6XRnw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 806C151D8;
	Sat, 21 Nov 2020 21:44:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AAD16064B;
	Sat, 21 Nov 2020 21:44:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A2C57180954D;
	Sat, 21 Nov 2020 21:44:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ALLibhS027759 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sat, 21 Nov 2020 16:44:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 394FF2026D13; Sat, 21 Nov 2020 21:44:37 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 341AE2026D12
	for <linux-cachefs@redhat.com>; Sat, 21 Nov 2020 21:44:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D91FB811E78
	for <linux-cachefs@redhat.com>; Sat, 21 Nov 2020 21:44:34 +0000 (UTC)
Received: from natter.dneg.com (natter.dneg.com [193.203.89.68]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-43-n_DcPyQbPFutV8x-JSedZQ-1; 
	Sat, 21 Nov 2020 16:44:32 -0500
X-MC-Unique: n_DcPyQbPFutV8x-JSedZQ-1
Received: from localhost (localhost [127.0.0.1])
	by natter.dneg.com (Postfix) with ESMTP id E3C7613A09A7;
	Sat, 21 Nov 2020 21:44:29 +0000 (GMT)
X-Virus-Scanned: amavisd-new at mx-dneg
Received: from natter.dneg.com ([127.0.0.1])
	by localhost (natter.dneg.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id S3qMFKqxMrqS; Sat, 21 Nov 2020 21:44:29 +0000 (GMT)
Received: from zrozimbrai.dneg.com (zrozimbrai.dneg.com [10.11.20.12])
	by natter.dneg.com (Postfix) with ESMTPS id C2334137178C;
	Sat, 21 Nov 2020 21:44:29 +0000 (GMT)
Received: from localhost (localhost [127.0.0.1])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id AF0C2815D119;
	Sat, 21 Nov 2020 21:44:29 +0000 (GMT)
Received: from zrozimbrai.dneg.com ([127.0.0.1])
	by localhost (zrozimbrai.dneg.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id oIWOE7EDQnYr; Sat, 21 Nov 2020 21:44:29 +0000 (GMT)
Received: from localhost (localhost [127.0.0.1])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id 939B18157E6E;
	Sat, 21 Nov 2020 21:44:29 +0000 (GMT)
X-Virus-Scanned: amavisd-new at zimbra-dneg
Received: from zrozimbrai.dneg.com ([127.0.0.1])
	by localhost (zrozimbrai.dneg.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id PaaqoMFsRI2S; Sat, 21 Nov 2020 21:44:29 +0000 (GMT)
Received: from zrozimbra1.dneg.com (zrozimbra1.dneg.com [10.11.16.16])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id 44A338157961;
	Sat, 21 Nov 2020 21:44:29 +0000 (GMT)
Date: Sat, 21 Nov 2020 21:44:29 +0000 (GMT)
From: Daire Byrne <daire@dneg.com>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <1758069641.91412432.1605995069116.JavaMail.zimbra@dneg.com>
In-Reply-To: <5f8e9e0cb53c89a7d1c156a6799c6dbc6db96dae.camel@kernel.org>
References: <20201117031601.GB10526@fieldses.org>
	<1605583086-19869-2-git-send-email-bfields@redhat.com>
	<a5704a8f7a6ebdfa60d4fa996a4d9ebaacc7daaf.camel@kernel.org>
	<20201117152636.GC4556@fieldses.org>
	<725499c144317aac1a03f0334a22005588dbdefc.camel@kernel.org>
	<20201120223831.GB7705@fieldses.org>
	<20201120224438.GC7705@fieldses.org>
	<5f8e9e0cb53c89a7d1c156a6799c6dbc6db96dae.camel@kernel.org>
MIME-Version: 1.0
Thread-Topic: nfsd: pre/post attr is using wrong change attribute
Thread-Index: 9SQ8W8XP7WrkbqlFFbnJGOfc9kG89A==
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: bfields <bfields@fieldses.org>, linux-nfs <linux-nfs@vger.kernel.org>,
	linux-cachefs <linux-cachefs@redhat.com>,
	"J. Bruce Fields" <bfields@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

----- On 21 Nov, 2020, at 01:03, Jeff Layton jlayton@kernel.org wrote:
> On Fri, 2020-11-20 at 17:44 -0500, J. Bruce Fields wrote:
>> On Fri, Nov 20, 2020 at 05:38:31PM -0500, J. Bruce Fields wrote:
>> > On Tue, Nov 17, 2020 at 10:34:57AM -0500, Jeff Layton wrote:
>> > > On Tue, 2020-11-17 at 10:26 -0500, J. Bruce Fields wrote:
>> > > > On Tue, Nov 17, 2020 at 07:34:49AM -0500, Jeff Layton wrote:
>> > > > > I don't think I described what I was thinking well. Let me try again...
>> > > > > 
>> > > > > There should be no need to change the code in iversion.h -- I think we
>> > > > > can do this in a way that's confined to just nfsd/export code.
>> > > > > 
>> > > > > What I would suggest is to have nfsd4_change_attribute call the
>> > > > > fetch_iversion op if it exists, instead of checking IS_I_VERSION and
>> > > > > doing the stuff in that block. If fetch_iversion is NULL, then just use
>> > > > > the ctime.
>> > > > > 
>> > > > > Then, you just need to make sure that the filesystems' export_ops have
>> > > > > an appropriate fetch_iversion vector. xfs, ext4 and btrfs can just call
>> > > > > inode_query_iversion, and NFS and Ceph can call inode_peek_iversion_raw.
>> > > > > The rest of the filesystems can leave fetch_iversion as NULL (since we
>> > > > > don't want to use it on them).
>> > > > 
>> > > > Thanks for your patience, that makes sense, I'll try it.
>> > > > 
>> > > 
>> > > There is one gotcha in here though... ext4 needs to also handle the case
>> > > where SB_I_VERSION is not set. The simple fix might be to just have
>> > > different export ops for ext4 based on whether it was mounted with -o
>> > > iversion or not, but maybe there is some better way to do it?
>> > 
>> > I was thinking ext4's export op could check for I_VERSION on its own and
>> > vary behavior based on that.
>> > 
>> > I'll follow up with new patches in a moment.
>> > 
>> > I think the first one's all that's needed to fix the problem Daire
>> > identified.  I'm a little less sure of the rest.

I can confirm that patch 1/8 alone does indeed address the reported revalidation issue for us (as did the previous patch). The re-export server's client cache seems to remain intact and can serve the same cached results to multiple clients.

>> > Lightly tested, just by running them through my usual regression tests
>> > (which don't re-export) and then running connectathon on a 4.2 re-export
>> > of a 4.2 mount.
>> > 
>> > The latter triggered a crash preceded by a KASAN use-after free warning.
>> > Looks like it might be a problem with blocking lock notifications,
>> > probably not related to these patches.
>> >
> The set looks pretty reasonable at first glance. Nice work.
> 
> Once you put this in, I'll plan to add a suitable fetch_iversion op for
> ceph too.
> 
>> Another nit I ran across:
>> 
>> Some NFSv4 directory-modifying operations return pre- and post- change
>> attributes together with an "atomic" flag that's supposed to indicate
>> whether the change attributes were read atomically with the operation.
>> It looks like we're setting the atomic flag under the assumptions that
>> local vfs locks are sufficient to guarantee atomicity, which isn't right
>> when we're exporting a distributed filesystem.
>> 
>> In the case we're reexporting NFS I guess ideal would be to use the pre-
>> and post- attributes that the original server returned and also save
>> having to do extra getattr calls.  Not sure how we'd do that,
>> though--more export operations?  Maybe for now we could just figure out
>> when to turn off the atomic bit.
> 
> Oh yeah, good point.
> 
> I'm not even sure that local locks are really enough -- IIRC, there are
> still some race windows between doing the metadata operations and the
> getattrs called to fill pre/post op attrs. Still, those windows are a
> lot larger on something like NFS, so setting the flag there is really
> stretching things.
> 
> One hacky fix might be to add a flags field to export_operations, and
> have one that indicates that the atomic flag shouldn't be set. Then we
> could add that flag to all of the netfs' (nfs, ceph, cifs), and anywhere
> else that we thought it appropriate?
> 
> That approach might be helpful later too since we're starting to see a
> wider variety of exportable filesystems these days. We may need more
> "quirk" flags like this.
> --
> Jeff Layton <jlayton@kernel.org>

I should also mention that I still see a lot of unexpected repeat lookups even with the iversion optimisation patches with certain workloads. For example, looking at a network capture on the re-export server I might see 100s of getattr calls to the originating server for the same filehandle within 30 seconds which I would have expected the client cache to serve. But it could also be that the client cache is under memory pressure and not holding that data for very long.

But now I do wonder if these NFSv4 directory modifications and pre/post change attributes could be one potential contributor? I might run some production loads with a v3 re-export of a v3 server to see if that changes anything.

Many thanks again for the patches, I will take the entire set and run them through our production re-export workloads to see if anything shakes out.

Daire

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

