Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4F762AF18
	for <lists+linux-cachefs@lfdr.de>; Wed, 16 Nov 2022 00:07:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668553627;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6WfIA7d1IW+u5KRDEvm/ttMKjAzo5Qtc8ZhgIoCCfYI=;
	b=hCec5gx5SKixJ39Ols5Al80qLE2qza4PI96C+p8oaE4Cc2yfUCNtoIiSs/ImMWARSfphut
	BNn0pCVPVQ6RTJC00KmTM7oj4hSdu+e49+2uOzrFPcMYiagRyxa3ESSNYMHWeCvcy67BfB
	1wFInsAkvhPiOyczJuBhZL1Vohy+4ig=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-wMgRw8-cPJiLwPxAhyCDlA-1; Tue, 15 Nov 2022 18:07:04 -0500
X-MC-Unique: wMgRw8-cPJiLwPxAhyCDlA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D62A63C02188;
	Tue, 15 Nov 2022 23:07:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F39BE40C6EC3;
	Tue, 15 Nov 2022 23:07:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C7A6E19465A3;
	Tue, 15 Nov 2022 23:07:02 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F3E9E1946597 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 15 Nov 2022 23:06:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6840D1121320; Tue, 15 Nov 2022 23:06:55 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60EEB112131E
 for <linux-cachefs@redhat.com>; Tue, 15 Nov 2022 23:06:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42E1985A59D
 for <linux-cachefs@redhat.com>; Tue, 15 Nov 2022 23:06:55 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-cqBLz_M4Pd2Kz32omp1gDA-1; Tue, 15 Nov 2022 18:06:53 -0500
X-MC-Unique: cqBLz_M4Pd2Kz32omp1gDA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CA09DB81A53;
 Tue, 15 Nov 2022 23:01:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 732D5C433D6;
 Tue, 15 Nov 2022 23:01:02 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 53A91C395F6; Tue, 15 Nov 2022 23:01:02 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <1846994.1668547169@warthog.procyon.org.uk>
References: <1846994.1668547169@warthog.procyon.org.uk>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <1846994.1668547169@warthog.procyon.org.uk>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
 tags/netfs-fixes-20221115
X-PR-Tracked-Commit-Id: 5e51c627c5acbcf82bb552e17533a79d2a6a2600
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 59d0d52c30d4991ac4b329f049cc37118e00f5b0
Message-Id: <166855326232.27083.6280024386871580610.pr-tracker-bot@kernel.org>
Date: Tue, 15 Nov 2022 23:01:02 +0000
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Linux-cachefs] [GIT PULL] netfs: Fix folio unmarking/unlocking
 loops
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
Cc: Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 willy@infradead.org, linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
 torvalds@linux-foundation.org
MIME-Version: 1.0
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The pull request you sent on Tue, 15 Nov 2022 21:19:29 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/netfs-fixes-20221115

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/59d0d52c30d4991ac4b329f049cc37118e00f5b0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

