Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D1056C4B5
	for <lists+linux-cachefs@lfdr.de>; Sat,  9 Jul 2022 01:27:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657322847;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cRF+8OGGnfO+saSwX76bUqvTispmNAWK8VS1Mi8iUyk=;
	b=KLHppRYkM+d9uLTZziCmjeJWyYlW8W/WsNr/ll5zZe7w5d1PCPSJApKzoxgB0ILDSpeJgH
	4yGofsat9A1LBYcCLN6v804Z7kVjBaJjS3U6M2ejloJS/XrSRlJ9Jam6uocqAoa8hOHtwI
	eNzwPL8QCptdED3enerH/xBXa4z7BOg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-Y3EXNM_rMOKxOo3w0Ya3Lw-1; Fri, 08 Jul 2022 19:27:21 -0400
X-MC-Unique: Y3EXNM_rMOKxOo3w0Ya3Lw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 683B73C02B7F;
	Fri,  8 Jul 2022 23:27:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CFD882166B29;
	Fri,  8 Jul 2022 23:27:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 777621947075;
	Fri,  8 Jul 2022 23:27:18 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BAED11947040 for <linux-cachefs@listman.corp.redhat.com>;
 Fri,  8 Jul 2022 23:27:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AADE0492CA2; Fri,  8 Jul 2022 23:27:17 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A71AF492C3B
 for <linux-cachefs@redhat.com>; Fri,  8 Jul 2022 23:27:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E41C101AA45
 for <linux-cachefs@redhat.com>; Fri,  8 Jul 2022 23:27:17 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-sS7dqz0HNmuSJPiIhtJ8Vw-1; Fri, 08 Jul 2022 19:27:16 -0400
X-MC-Unique: sS7dqz0HNmuSJPiIhtJ8Vw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8C95AB82A16;
 Fri,  8 Jul 2022 23:17:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B415C341C0;
 Fri,  8 Jul 2022 23:17:32 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 35996E45BDB; Fri,  8 Jul 2022 23:17:32 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <3753787.1657315951@warthog.procyon.org.uk>
References: <3753787.1657315951@warthog.procyon.org.uk>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <3753787.1657315951@warthog.procyon.org.uk>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
 tags/fscache-fixes-20220708
X-PR-Tracked-Commit-Id: 85e4ea1049c70fb99de5c6057e835d151fb647da
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e5524c2a1fc4002a52e16236659e779767617a4f
Message-Id: <165732225221.30799.13034712144647468572.pr-tracker-bot@kernel.org>
Date: Fri, 08 Jul 2022 23:17:32 +0000
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [Linux-cachefs] [GIT PULL] fscache: Miscellaneous fixes
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
Cc: Jia Zhu <zhujia.zj@bytedance.com>, linux-cachefs@redhat.com,
 Max Kellermann <mk@cm4all.com>, linux-erofs@lists.ozlabs.org,
 jlayton@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Yue Hu <huyue2@coolpad.com>,
 torvalds@linux-foundation.org
MIME-Version: 1.0
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The pull request you sent on Fri, 08 Jul 2022 22:32:31 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/fscache-fixes-20220708

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e5524c2a1fc4002a52e16236659e779767617a4f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

