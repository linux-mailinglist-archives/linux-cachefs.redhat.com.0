Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DAE483B2C7C
	for <lists+linux-cachefs@lfdr.de>; Thu, 24 Jun 2021 12:33:18 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-ZOfUHwyRNK2yhNsmdu00Tw-1; Thu, 24 Jun 2021 06:33:16 -0400
X-MC-Unique: ZOfUHwyRNK2yhNsmdu00Tw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59A7BA0CB0;
	Thu, 24 Jun 2021 10:33:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 355AD100AE35;
	Thu, 24 Jun 2021 10:33:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2E5611809C99;
	Thu, 24 Jun 2021 10:33:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15OAX3CM032006 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 24 Jun 2021 06:33:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 90B102087A55; Thu, 24 Jun 2021 10:33:03 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AC37200D8DF
	for <linux-cachefs@redhat.com>; Thu, 24 Jun 2021 10:33:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F1E0108C18F
	for <linux-cachefs@redhat.com>; Thu, 24 Jun 2021 10:33:01 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-147-H1fJjgbTN5GSK3ah-GDg7w-1;
	Thu, 24 Jun 2021 06:32:55 -0400
X-MC-Unique: H1fJjgbTN5GSK3ah-GDg7w-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id B2E8161358;
	Thu, 24 Jun 2021 10:32:52 +0000 (UTC)
Message-ID: <1224262b5f6ec7d646b85ed43b55b64063c35ecf.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>, torvalds@linux-foundation.org
Date: Thu, 24 Jun 2021 06:32:51 -0400
In-Reply-To: <2842348.1624308062@warthog.procyon.org.uk>
References: <2842348.1624308062@warthog.procyon.org.uk>
User-Agent: Evolution 3.40.2 (3.40.2-1.fc34)
MIME-Version: 1.0
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
Cc: Andrew W Elble <aweits@rit.edu>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-cachefs@redhat.com, Al Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [GIT PULL] netfs, afs: Fix write_begin/end
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2021-06-21 at 21:41 +0100, David Howells wrote:
> Hi Linus,
> 
> Could you pull this please?  It includes patches to fix netfs_write_begin()
> and afs_write_end() in the following ways:
> 
>  (1) In netfs_write_begin(), extract the decision about whether to skip a
>      page out to its own helper and have that clear around the region to be
>      written, but not clear that region.  This requires the filesystem to
>      patch it up afterwards if the hole doesn't get completely filled.
> 
>  (2) Use offset_in_thp() in (1) rather than manually calculating the offset
>      into the page.
> 
>  (3) Due to (1), afs_write_end() now needs to handle short data write into
>      the page by generic_perform_write().  I've adopted an analogous
>      approach to ceph of just returning 0 in this case and letting the
>      caller go round again.
> 
> It also adds a note that (in the future) the len parameter may extend
> beyond the page allocated.  This is because the page allocation is deferred
> to write_begin() and that gets to decide what size of THP to allocate.
> 
> Thanks,
> David
> 
> Link: https://lore.kernel.org/r/20210613233345.113565-1-jlayton@kernel.org/
> Link: https://lore.kernel.org/r/162367681795.460125.11729955608839747375.stgit@warthog.procyon.org.uk/ # v1
> Link: https://lore.kernel.org/r/162391823192.1173366.9740514875196345746.stgit@warthog.procyon.org.uk/ # v2
> Link: https://lore.kernel.org/r/162429000639.2770648.6368710175435880749.stgit@warthog.procyon.org.uk/ # v3
> 
> Changes
> =======
> 
> ver #3:
>    - Drop the bits that make afs take account of len exceeding the end of
>      the page in afs_write_begin/end().
> 
> ver #2:
>    - Removed a var that's no longer used (spotted by the kernel test robot)
>    - Removed a forgotten "noinline".
> 
> ver #1:
>    - Prefixed the Jeff's new helper with "netfs_".
>    - Don't call zero_user_segments() for a full-page write.
>    - Altered the beyond-last-page check to avoid a DIV.
>    - Removed redundant zero-length-file check.
>    - Added patches to fix afs.
> 
> ---
> The following changes since commit 009c9aa5be652675a06d5211e1640e02bbb1c33d:
> 
>   Linux 5.13-rc6 (2021-06-13 14:43:10 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/netfs-fixes-20210621
> 
> for you to fetch changes up to 827a746f405d25f79560c7868474aec5aee174e1:
> 
>   netfs: fix test for whether we can skip read when writing beyond EOF (2021-06-21 21:24:07 +0100)
> 
> ----------------------------------------------------------------
> netfslib fixes
> 
> ----------------------------------------------------------------
> David Howells (1):
>       afs: Fix afs_write_end() to handle short writes
> 
> Jeff Layton (1):
>       netfs: fix test for whether we can skip read when writing beyond EOF
> 
>  fs/afs/write.c         | 11 +++++++++--
>  fs/netfs/read_helper.c | 49 ++++++++++++++++++++++++++++++++++++-------------
>  2 files changed, 45 insertions(+), 15 deletions(-)
> 

Hi Linus,

Is there some reason you haven't pulled these fixes? The netfs fix in
particular fixes a data corruption bug in cephfs, so we're quite keen to
get that in before v5.13 ships.

Thanks,
-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

