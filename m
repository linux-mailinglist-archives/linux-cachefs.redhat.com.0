Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BE3649919
	for <lists+linux-cachefs@lfdr.de>; Mon, 12 Dec 2022 08:01:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670828492;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9AmvFAZAUU3Pvo/dmYUq1UbMgQKFW9/XWiCBSIYBvvo=;
	b=TWZ8OznBevthpGRDilS+U3ISj4GSqekfBJdQ5WByteDS7692y2N2bJQrf5UZ1m1znkCUCp
	CYfCnDsXhycUU/RlPEAXYCkysO0vchARweq0sUmNkjHTpmZBOCIF0c5Ebh/ypSb0RmFbl0
	C62y4P4BcYrRtbBtPwMESmasPAGyPbo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-rP2jsjkANtiOYpa-AZAMyQ-1; Mon, 12 Dec 2022 02:01:28 -0500
X-MC-Unique: rP2jsjkANtiOYpa-AZAMyQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB38A804184;
	Mon, 12 Dec 2022 07:01:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 95AD1492B00;
	Mon, 12 Dec 2022 07:01:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A616D194658C;
	Mon, 12 Dec 2022 07:01:25 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ABD2D1946586 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 12 Dec 2022 07:01:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7167953A7; Mon, 12 Dec 2022 07:01:24 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6922E53A4
 for <linux-cachefs@redhat.com>; Mon, 12 Dec 2022 07:01:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4867829DD98B
 for <linux-cachefs@redhat.com>; Mon, 12 Dec 2022 07:01:24 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-KM3H_S8pMbCPNIZrjy_GxQ-1; Mon, 12 Dec 2022 02:01:20 -0500
X-MC-Unique: KM3H_S8pMbCPNIZrjy_GxQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EBD5960EA9;
 Mon, 12 Dec 2022 07:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8FE2C433EF;
 Mon, 12 Dec 2022 07:01:16 +0000 (UTC)
Date: Mon, 12 Dec 2022 15:01:12 +0800
From: Gao Xiang <xiang@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <Y5bRuDiEwUAK1si1@debian>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-erofs@lists.ozlabs.org, linux-cachefs@redhat.com,
 LKML <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>,
 Jeff Layton <jlayton@kernel.org>, Chao Yu <chao@kernel.org>,
 Yue Hu <huyue2@coolpad.com>, Jingbo Xu <jefflexu@linux.alibaba.com>,
 Hou Tao <houtao1@huawei.com>,
 Chen Zhongjin <chenzhongjin@huawei.com>,
 Jia Zhu <zhujia.zj@bytedance.com>
References: <Y5TB6E77vbpRMhIk@debian>
MIME-Version: 1.0
In-Reply-To: <Y5TB6E77vbpRMhIk@debian>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Linux-cachefs] [GIT PULL] erofs updates for 6.2-rc1 (fscache
 part inclusive)
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
Cc: Yue Hu <huyue2@coolpad.com>, Chen Zhongjin <chenzhongjin@huawei.com>,
 Chao Yu <chao@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-cachefs@redhat.com,
 Hou Tao <houtao1@huawei.com>, linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Linus,

On Sun, Dec 11, 2022 at 01:29:21AM +0800, Gao Xiang wrote:
> Hi Linus,
> 
> Once the merge window opens, could you consider this pull request for
> 6.2-rc1?
> 
> In this cycle, large folios are now enabled in the iomap/fscache mode
> for uncompressed files first.  In order to do that, we've also cleaned
> up better interfaces between erofs and fscache, which are acked by
> fscache/netfs folks and included in this pull request.
> 
> Other than that, there are random fixes around erofs over fscache and
> crafted images by syzbot, minor cleanups and documentation updates.
> 
> Note that there could be a trivial conflict between erofs and vfs
> tree according to linux-next report [1].
> 
> Happy Holidays!
> Gao Xiang
> 
> [1] https://lore.kernel.org/r/20221205092415.56cc6e19@canb.auug.org.au/
> 
> The following changes since commit eb7081409f94a9a8608593d0fb63a1aa3d6f95d8:
> 
>   Linux 6.1-rc6 (2022-11-20 16:02:16 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git tags/erofs-for-6.2-rc1
> 
> for you to fetch changes up to c505feba4c0d76084e56ec498ce819f02a7043ae:
> 

Sorry for bothering again.

Just having seen v6.2 pull request requirements together with
Linux 6.1 announcement.

Comparing with the latest -next on the last Thursday, there was one-liner
addition on
commit 927e5010ff5b ("erofs: use kmap_local_page() only for erofs_bread()")
as below:

diff --git a/fs/erofs/inode.c b/fs/erofs/inode.c
index 85932086d23f..5b3a793103af 100644
--- a/fs/erofs/inode.c
+++ b/fs/erofs/inode.c
@@ -268,6 +268,7 @@ static int erofs_fill_inode(struct inode *inode)
 	case S_IFDIR:
 		inode->i_op = &erofs_dir_iops;
 		inode->i_fop = &erofs_dir_fops;
+		inode_nohighmem(inode);
 		break;
 	case S_IFLNK:
 		err = erofs_fill_symlink(inode, kaddr, ofs)

since I found erofs_lookup() could break on x86 platform with HIGHMEM
enabled this weekend and I made all dirs inode_nohighmem() and folded
into the original patch since it's no needed to keep dirs in HIGHMEM.
I don't find other strange other than this.

Because there is no -next version on Monday, if you would like to
take all commits in -next you could take
  git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git tags/erofs-for-6.2-rc1-alt

instead (the top commit is e5293c693d68f705787480159c4cd332c09c5e67.)

In that way I will send another patch to fix the issue above later,
but if it's possible, it'd be better to apply "tags/erofs-for-6.2-rc1"
directly...

The diffstat of tags/erofs-for-6.2-rc1-alt is:

Chen Zhongjin (1):
      erofs: Fix pcluster memleak when its block address is zero

Gao Xiang (5):
      erofs: update documentation
      erofs: clean up cached I/O strategies
      erofs: use kmap_local_page() only for erofs_bread()
      erofs: fix missing unmap if z_erofs_get_extent_compressedlen() fails
      erofs: validate the extent length for uncompressed pclusters

Hou Tao (1):
      erofs: check the uniqueness of fsid in shared domain in advance

Jingbo Xu (5):
      erofs: enable large folios for iomap mode
      fscache,cachefiles: add prepare_ondemand_read() callback
      erofs: switch to prepare_ondemand_read() in fscache mode
      erofs: support large folios for fscache mode
      erofs: enable large folios for fscache mode

 Documentation/filesystems/erofs.rst |  38 ++--
 fs/cachefiles/io.c                  |  77 ++++---
 fs/erofs/data.c                     |  10 +-
 fs/erofs/fscache.c                  | 408 ++++++++++++++++--------------------
 fs/erofs/inode.c                    |   1 +
 fs/erofs/internal.h                 |  13 +-
 fs/erofs/super.c                    |   2 +-
 fs/erofs/xattr.c                    |   8 +-
 fs/erofs/zdata.c                    |  80 +++----
 fs/erofs/zmap.c                     |  15 +-
 include/linux/netfs.h               |   8 +
 include/trace/events/cachefiles.h   |  27 +--
 12 files changed, 343 insertions(+), 344 deletions(-)

Thanks,
Gao Xiang

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

