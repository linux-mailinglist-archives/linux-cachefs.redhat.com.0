Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 504535A85BB
	for <lists+linux-cachefs@lfdr.de>; Wed, 31 Aug 2022 20:36:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661970986;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gXsfmnDoWjij9U5JDdvz/gfyCYc3sQ7g65KiyTo7L6s=;
	b=KWpr2q8IT3zKS5vPRPEvSFtIiwOtsuVUVL51wa9OrAftBxZk7rA5QhvuxIUkupebdd9VZf
	sSe9/OrS83j8Dxfpjj7bptwht8/NiaQo1QsObRSRrqKNAuipJEIeEgODuiZxerTuFnDpLW
	Yd2Ag0LwGruX8BrhGYMbQWE9DcS8aDo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-6BS4g3f_Mg2E4HswVvVfHA-1; Wed, 31 Aug 2022 14:36:23 -0400
X-MC-Unique: 6BS4g3f_Mg2E4HswVvVfHA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C2F08037AE;
	Wed, 31 Aug 2022 18:36:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9627240B40C7;
	Wed, 31 Aug 2022 18:36:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 584F11946A4C;
	Wed, 31 Aug 2022 18:36:21 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4E3421946A40 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 31 Aug 2022 17:31:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3CDE9141511A; Wed, 31 Aug 2022 17:31:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 393451415117
 for <linux-cachefs@redhat.com>; Wed, 31 Aug 2022 17:31:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 228C6811E83
 for <linux-cachefs@redhat.com>; Wed, 31 Aug 2022 17:31:34 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-286-RosjFF6BPqeJXMz207qxhQ-1; Wed, 31 Aug 2022 13:31:31 -0400
X-MC-Unique: RosjFF6BPqeJXMz207qxhQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 758A261AC8;
 Wed, 31 Aug 2022 17:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CDB46C433D6;
 Wed, 31 Aug 2022 17:20:02 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A7FB8C4166F; Wed, 31 Aug 2022 17:20:02 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <1867371.1661962479@warthog.procyon.org.uk>
References: <1867371.1661962479@warthog.procyon.org.uk>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <1867371.1661962479@warthog.procyon.org.uk>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
 tags/fscache-fixes-20220831
X-PR-Tracked-Commit-Id: 1122f40072731525c06b1371cfa30112b9b54d27
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c5e4d5e99162ba8025d58a3af7ad103f155d2df7
Message-Id: <166196640267.5012.5441408429818523211.pr-tracker-bot@kernel.org>
Date: Wed, 31 Aug 2022 17:20:02 +0000
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [Linux-cachefs] [GIT PULL] fscache,
 cachefiles: Miscellaneous fixes
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
Cc: Khalid Masum <khalid.masum.92@gmail.com>, linux-fsdevel@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, Yongqing Li <liyongqing@bytedance.com>,
 linux-cachefs@redhat.com, Sun Ke <sunke32@huawei.com>,
 torvalds@linux-foundation.org, Dan Carpenter <dan.carpenter@oracle.com>
MIME-Version: 1.0
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The pull request you sent on Wed, 31 Aug 2022 17:14:39 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/fscache-fixes-20220831

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c5e4d5e99162ba8025d58a3af7ad103f155d2df7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

