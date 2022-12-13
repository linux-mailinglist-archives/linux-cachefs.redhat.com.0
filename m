Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 927D364AF17
	for <lists+linux-cachefs@lfdr.de>; Tue, 13 Dec 2022 06:09:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670908168;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AKyftcRLXQ/ui5l5BqmSGaHjMO40sqcSlPgnKVyUMGU=;
	b=WUsXqKNzBh+8ydlxiREHo0uQnKCpzzkFqAw5CKFGNDxtsemQQx2MTCFT9VpjgeFU5OFEZP
	GGyOKe1MOH6VkZwuYgPx/B6t3KKKkNGbRsmBGVm/nVc/qNqPfi7XHe/FV6lKjCSm6AqCSB
	me+1B8b4e7SqadBu3oMRDmKfwcE8Jnw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-WWcRDa2eMHSoAU5pX5d_UQ-1; Tue, 13 Dec 2022 00:09:25 -0500
X-MC-Unique: WWcRDa2eMHSoAU5pX5d_UQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6BAC85A588;
	Tue, 13 Dec 2022 05:09:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AD153C15BA0;
	Tue, 13 Dec 2022 05:09:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5585D1946595;
	Tue, 13 Dec 2022 05:09:24 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AD40B1946586 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 13 Dec 2022 05:09:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9C906492B02; Tue, 13 Dec 2022 05:09:22 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 952A1492B00
 for <linux-cachefs@redhat.com>; Tue, 13 Dec 2022 05:09:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74A433803924
 for <linux-cachefs@redhat.com>; Tue, 13 Dec 2022 05:09:22 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-530-8pEXN7_IP2iOqRpGCljIvQ-1; Tue, 13 Dec 2022 00:09:20 -0500
X-MC-Unique: 8pEXN7_IP2iOqRpGCljIvQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CC75C6131B;
 Tue, 13 Dec 2022 05:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3680FC433EF;
 Tue, 13 Dec 2022 05:00:11 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 1FF4FC395EE; Tue, 13 Dec 2022 05:00:11 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <Y5TB6E77vbpRMhIk@debian>
References: <Y5TB6E77vbpRMhIk@debian>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Y5TB6E77vbpRMhIk@debian>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git
 tags/erofs-for-6.2-rc1
X-PR-Tracked-Commit-Id: c505feba4c0d76084e56ec498ce819f02a7043ae
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4a6bff1187409f2c2ba1b17234541d314f0680fc
Message-Id: <167090761112.4886.12716661902911748332.pr-tracker-bot@kernel.org>
Date: Tue, 13 Dec 2022 05:00:11 +0000
To: Gao Xiang <xiang@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
Cc: Yue Hu <huyue2@coolpad.com>, Linus Torvalds <torvalds@linux-foundation.org>,
 Chen Zhongjin <chenzhongjin@huawei.com>, Chao Yu <chao@kernel.org>,
 Jeff Layton <jlayton@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-cachefs@redhat.com, Hou Tao <houtao1@huawei.com>,
 linux-erofs@lists.ozlabs.org
MIME-Version: 1.0
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The pull request you sent on Sun, 11 Dec 2022 01:29:12 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git tags/erofs-for-6.2-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4a6bff1187409f2c2ba1b17234541d314f0680fc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

