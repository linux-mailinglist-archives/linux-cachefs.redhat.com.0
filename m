Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D175FEA13
	for <lists+linux-cachefs@lfdr.de>; Fri, 14 Oct 2022 10:06:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665734817;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aNEnt8nqYAjt9A+IEd+wTovpqh8sDa8LZWNa17+GoDY=;
	b=XL/u0RqUqvjB8nM/BHhf0Jgi043UwQ0vLmIrArdkHFnMi399Gb0mg6gL69Q67/DPHECM04
	TNr1gX/UgbAyzWSBFN1Y+80Rx8jReZ1EKk+DCRh7aD4/jrmRUinXrE4FDv+UHA6Ji4/2ZE
	06h2g8PSNRVlaprcEgTaXLJlgEDhkEs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-SXp1mNtbPSiV6GsIXv7quA-1; Fri, 14 Oct 2022 04:06:54 -0400
X-MC-Unique: SXp1mNtbPSiV6GsIXv7quA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF68129324A0;
	Fri, 14 Oct 2022 08:06:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 05E4E40398B1;
	Fri, 14 Oct 2022 08:06:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7CBB4194658F;
	Fri, 14 Oct 2022 08:06:40 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 007791946587 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 14 Oct 2022 08:06:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9CD8663AE9; Fri, 14 Oct 2022 08:06:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9532E4EA4A
 for <linux-cachefs@redhat.com>; Fri, 14 Oct 2022 08:06:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCCDF2932496
 for <linux-cachefs@redhat.com>; Fri, 14 Oct 2022 08:06:36 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-256-A8X6clKYPxKBL44M3xQSFg-1; Fri, 14 Oct 2022 04:06:34 -0400
X-MC-Unique: A8X6clKYPxKBL44M3xQSFg-1
Received: by mail-pg1-f174.google.com with SMTP id f193so3723467pgc.0
 for <linux-cachefs@redhat.com>; Fri, 14 Oct 2022 01:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=90kmgNBxYuQDRjoJ++HQAlxGZIWs9oLzsbBHk0vLgUo=;
 b=DCDwuNZbopgAubyZYalwCqYQyric4SlMsQA3arPjvybhjkBf9bjSBlp9MeuuxvKe62
 XgWJlh5EAG7j3p5sRhwK2nA14QgzEt4yac6CILZWmJNifx+nKH2B7Iw/kcvSKSmMJJ9T
 GDipUsv6ELu2+AMW7CVREoz0LRjeup/AzV1GCW55pRBqsOnHkxUArImAa59SPRVyJmC6
 X6BBAAEaBcGI8n4BJWd3b+epYt3LM4Zz4zMZXWTE6hIsL3Use7D4n0TtMDLmP0T5Jmnb
 W1IlhPft2EizUfWeZBMyeq9Ar0hX15mOO8xcxD1wM6VacE2YDx0TEaecHotj0hr/7Oha
 PRnw==
X-Gm-Message-State: ACrzQf0+KuZnjYH0NraWW41yGt0OUsFZ8fQvK17jQwb+Q9ZfJitwbdN1
 qIvNFtqAdOVYxQsGDHoXNAR93w==
X-Google-Smtp-Source: AMsMyM5Zx7Qn9iRmKEY5gHbnSMEHHrDjyxn7uuX9kvfDoFaNsj+MDU3tUeehdFxmy9MnBKR6CLGVUA==
X-Received: by 2002:a65:63ce:0:b0:43a:2103:b7b8 with SMTP id
 n14-20020a6563ce000000b0043a2103b7b8mr3666169pgv.59.1665734793849; 
 Fri, 14 Oct 2022 01:06:33 -0700 (PDT)
Received: from C02G705SMD6V.bytedance.net ([63.216.146.188])
 by smtp.gmail.com with ESMTPSA id
 ik20-20020a170902ab1400b001730a1af0fbsm1119196plb.23.2022.10.14.01.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 01:06:33 -0700 (PDT)
From: Jia Zhu <zhujia.zj@bytedance.com>
To: dhowells@redhat.com,
	xiang@kernel.org,
	jefflexu@linux.alibaba.com
Date: Fri, 14 Oct 2022 16:05:54 +0800
Message-Id: <20221014080559.42108-1-zhujia.zj@bytedance.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Linux-cachefs] [PATCH V3 0/5] Introduce daemon failover mechanism
 to recover from crashing
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
Cc: linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Changes since v2:
1. Remove useless header file.
2. Remove useless assignment statement about object_id.
3. Modify some code comments.
4. Add Reviewed-by lines from Jingbo Xu.

[Background]
============
In ondemand read mode, if user daemon closes anonymous fd(e.g. daemon
crashes), subsequent read and inflight requests based on these fd will
return -EIO.
Even if above mentioned case is tolerable for some individual users, but
when it happenens in real cloud service production environment, such IO
errors will be passed to cloud service users and impact its working jobs.
It's terrible for cloud service stability.

[Design]
========
This patchset introduce three states for ondemand object:
CLOSE: Object which just be allocated or closed by user daemon.
OPEN: Object which related OPEN request has been processed correctly.
REOPENING: Object which has been closed, and is drived to open by a read
request.

[Flow Path]
===========
[Daemon Crash] 
0. Daemon use UDS send/receive fd to keep and pass the fd reference of
   "/dev/cachefiles".
1. User daemon crashes -> restart and recover dev fd's reference.
2. User daemon write "restore" to device.
   2.1 Reset the object's state from CLOSE to OPENING.
   2.2 Init a work which reinit the object and add it to wq. (daemon can
       get rid of kernel space and handle that open request).
3. The user of upper filesystem won't notice that the daemon ever crashed
   since the inflight IO is restored and handled correctly.

[Daemon Close fd]
1. User daemon closes an anonymous fd.
2. User daemon reads a READ request which the associated anonymous fd was
   closed and init a work which re-open the object.
3. User daemon handles above open request normally.
4. The user of upper filesystem won't notice that the daemon ever closed
   any fd since the closed object is re-opened and related request was
   handled correctly.

[Test]
======
There is a testcase for above mentioned scenario.
A user process read the file by fscache ondemand reading.
At the same time, we kill the daemon constantly.
The expected result is that the file read by user is consistent with
original, and the user doesn't notice that daemon has ever been killed.

https://github.com/userzj/demand-read-cachefilesd/commits/failover-test

[GitWeb]
========
https://github.com/userzj/linux/tree/fscache-failover-v4

RFC: https://lore.kernel.org/all/20220818135204.49878-1-zhujia.zj@bytedance.com/
V1: https://lore.kernel.org/all/20221011131552.23833-1-zhujia.zj@bytedance.com/
V2: https://lore.kernel.org/all/20221014030745.25748-1-zhujia.zj@bytedance.com/

Jia Zhu (5):
  cachefiles: introduce object ondemand state
  cachefiles: extract ondemand info field from cachefiles_object
  cachefiles: resend an open request if the read request's object is
    closed
  cachefiles: narrow the scope of triggering EPOLLIN events in ondemand
    mode
  cachefiles: add restore command to recover inflight ondemand read
    requests

 fs/cachefiles/daemon.c    |  14 +++-
 fs/cachefiles/interface.c |   6 ++
 fs/cachefiles/internal.h  |  57 +++++++++++++-
 fs/cachefiles/ondemand.c  | 158 ++++++++++++++++++++++++++++----------
 4 files changed, 188 insertions(+), 47 deletions(-)

-- 
2.20.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

