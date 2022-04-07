Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DA84F7E8E
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Apr 2022 14:02:47 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-P1E8RcemNm6zzT0HfybRvA-1; Thu, 07 Apr 2022 08:02:44 -0400
X-MC-Unique: P1E8RcemNm6zzT0HfybRvA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2384811E84;
	Thu,  7 Apr 2022 12:02:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A57C41402427;
	Thu,  7 Apr 2022 12:02:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3FF281940345;
	Thu,  7 Apr 2022 12:02:35 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DBD611947BBE for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  7 Apr 2022 12:02:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D1D89145B97F; Thu,  7 Apr 2022 12:02:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE10F1402427
 for <linux-cachefs@redhat.com>; Thu,  7 Apr 2022 12:02:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B537A185A79C
 for <linux-cachefs@redhat.com>; Thu,  7 Apr 2022 12:02:33 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-HkWDYglvOr2c0nehzeMzJQ-1; Thu, 07 Apr 2022 08:02:29 -0400
X-MC-Unique: HkWDYglvOr2c0nehzeMzJQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0CF5DB826BA;
 Thu,  7 Apr 2022 12:02:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 461E7C385A4;
 Thu,  7 Apr 2022 12:02:26 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: ceph-devel@vger.kernel.org,
	dhowells@redhat.com
Date: Thu,  7 Apr 2022 08:02:19 -0400
Message-Id: <20220407120224.76156-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: [Linux-cachefs] [RFC PATCH 0/5] ceph: convert to
 netfs_direct_read_iter
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
Cc: linux-cachefs@redhat.com, idryomov@gmail.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch is based on top of David Howells' netfs-lib branch [1]. That
tree adds new O_DIRECT read helpers to netfs.ko. This patchset converts
ceph to use it. With this, all of the usual xfstests pass for me on
ceph.

We should be able to rip out a large part of ceph_direct_read_write with
this set. I haven't done that here, and will probably wait until we have
converted ceph to use netfs DIO write helpers (which don't exist yet).
Once that's in place, we can just remove that function and related
infrastructure wholesale.

I'd like to get this into our testing branch for an eventual merge into
v5.19. We need it in our testing branch for a bit though.

David, in the past, I think we just based our master branch on top of
whatever branch you were feeding to -next. Around -rc3, could you
rebase netfs-lib on top of that and use that as a base for what you're
feeding into -next? Then we can just base our -next feeder branch onto
yours.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=netfs-lib

David Howells (1):
  ceph: Use the provided iterator in ceph_netfs_issue_op()

Jeff Layton (4):
  netfs: don't error out on short DIO reads
  ceph: set rsize in netfs_i_context from mount options
  ceph: enhance dout messages in issue_read codepaths
  ceph: switch to netfs_direct_read_iter

 fs/ceph/addr.c  | 55 ++++++++++++++++++++++++++++++++-----------------
 fs/ceph/file.c  |  3 +--
 fs/ceph/inode.c |  3 ++-
 fs/netfs/io.c   |  5 -----
 4 files changed, 39 insertions(+), 27 deletions(-)
-- 
2.35.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

