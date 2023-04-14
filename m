Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C426E2941
	for <lists+linux-cachefs@lfdr.de>; Fri, 14 Apr 2023 19:24:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681493079;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ujHkUtydAhJk2Kbxc86VT9M/bBQqmg/GfwDsSboiOco=;
	b=bG9COdjHK++4O/1MP1BRpOt5zjS7UALsgEgJUtRrKVpcIwXLIuEeJSOsv/BguK479H7V+Z
	0Li4oKM4J+nhWLy/KIsYH8iuxeRyQzJCnpsuAGYpDeyOLVqONKeZPUiyUTEdgnMCA8vzuF
	qUGazKZnCYj5Z0gCECp+reCCZVt72RI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-mpWH3rCsOFmgYCXEyz08EA-1; Fri, 14 Apr 2023 13:24:14 -0400
X-MC-Unique: mpWH3rCsOFmgYCXEyz08EA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86875384D032;
	Fri, 14 Apr 2023 17:23:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BF791112132D;
	Fri, 14 Apr 2023 17:23:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 83F0219472CD;
	Fri, 14 Apr 2023 17:23:54 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 933761946589 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 14 Apr 2023 17:23:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 454452166B2A; Fri, 14 Apr 2023 17:23:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E1752166B29
 for <linux-cachefs@redhat.com>; Fri, 14 Apr 2023 17:23:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D75A638470A4
 for <linux-cachefs@redhat.com>; Fri, 14 Apr 2023 17:23:52 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-4Q4Qhyc8Pa6OL9WfkK2Gaw-1; Fri, 14 Apr 2023 13:23:41 -0400
X-MC-Unique: 4Q4Qhyc8Pa6OL9WfkK2Gaw-1
Received: by mail-pj1-f41.google.com with SMTP id
 mq14-20020a17090b380e00b002472a2d9d6aso4689927pjb.5
 for <linux-cachefs@redhat.com>; Fri, 14 Apr 2023 10:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681492999; x=1684084999;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VT+0HvHjEsU+vTXyoXG01Ki1olkigaqjaaxRq0h7zD0=;
 b=GouNEL+kTqgWv7mXcQG0pH/ymvbXRY80KOarVX9PczV6EbQeYgDqbng94YszFEweot
 AKuvq5WnfRkDY3UuAgJYIPjipVXyNz6iwRJv/RIksD5EGK5lbEQerIarosg8og7wca5S
 LA9hUSqnmC0RywlpRQGXFJrGpXEbx+hliQhWQlJPglldM0iH2WBdkgmCyBkjJAT7Bhzk
 B0MG1PCCGtlmoakgWRf48kBkDfy01K1vaeInO9SUD5tclhKnAZqaizjwrf+qQLlVkdL7
 dB0qm5Cl151ZSnqIIfOmyZp7n3AzcNBRpIXWg/rjzG8C1qyc/BoWhCJDrtzyEd/x4tQH
 xMKw==
X-Gm-Message-State: AAQBX9eLa9Xy4tOVgAzUVYFX+jXEd8t6wVMUWK7RATVssLXrN8hoSFYf
 lIoOBvsoY6rSeQK/jn/rS9Il+Q==
X-Google-Smtp-Source: AKy350YoK4w2okqy34rm4+OZcZLR+GQ/jupsYmqKLeW08OcJZwUp+2x19/ioiaHyOTYBH/N7bCnvVw==
X-Received: by 2002:a17:902:c951:b0:1a6:8ee3:4e2e with SMTP id
 i17-20020a170902c95100b001a68ee34e2emr4809363pla.33.1681492998912; 
 Fri, 14 Apr 2023 10:23:18 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.243])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a631f4c000000b0051b8172fa68sm370315pgm.38.2023.04.14.10.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 10:23:18 -0700 (PDT)
From: Jia Zhu <zhujia.zj@bytedance.com>
To: dhowells@redhat.com,
	linux-cachefs@redhat.com
Date: Sat, 15 Apr 2023 01:22:34 +0800
Message-Id: <20230414172239.33743-1-zhujia.zj@bytedance.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Linux-cachefs] [PATCH V6 0/5] Introduce daemon failover mechanism
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
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Changes since v5:
In cachefiles_daemon_poll(), replace xa_for_each_marked with xas_for_each_marked.

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
The main idea of daemon failover is reopen the inflight req related object,
thus the newly started daemon could process the req as usual. 
To implement that, we need to support:
	1. Store inflight requests during daemon crash.
	2. Hold the handle of /dev/cachefiles(by container snapshotter/systemd).
BTW, if user chooses not to keep /dev/cachefiles fd, failover is not enabled.
Inflight requests return error and passed it to container.(same behavior as now).

[Flow Path]
===========
This patchset introduce three states for ondemand object:
CLOSE: Object which just be allocated or closed by user daemon.
OPEN: Object which related OPEN request has been processed correctly.
REOPENING: Object which has been closed, and is drived to open by a read
request.

1. Daemon use UDS send/receive fd to keep and pass the fd reference of
   "/dev/cachefiles".
2. User daemon crashes -> restart and recover dev fd's reference.
3. User daemon write "restore" to device.
   2.1 Reset the object's state from CLOSE to REOPENING.
   2.2 Init a work which reinit the object and add it to wq. (daemon can
       get rid of kernel space and handle that open request).
4. The user of upper filesystem won't notice that the daemon ever crashed
   since the inflight IO is restored and handled correctly.

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
https://github.com/userzj/linux/tree/fscache-failover-v6

RFC: https://lore.kernel.org/all/20220818135204.49878-1-zhujia.zj@bytedance.com/
V1: https://lore.kernel.org/all/20221011131552.23833-1-zhujia.zj@bytedance.com/
V2: https://lore.kernel.org/all/20221014030745.25748-1-zhujia.zj@bytedance.com/
V3: https://lore.kernel.org/all/20221014080559.42108-1-zhujia.zj@bytedance.com/
V4: https://lore.kernel.org/all/20230111052515.53941-1-zhujia.zj@bytedance.com/
V5: https://lore.kernel.org/all/20230329140155.53272-1-zhujia.zj@bytedance.com/

Jia Zhu (5):
  cachefiles: introduce object ondemand state
  cachefiles: extract ondemand info field from cachefiles_object
  cachefiles: resend an open request if the read request's object is
    closed
  cachefiles: narrow the scope of triggering EPOLLIN events in ondemand
    mode
  cachefiles: add restore command to recover inflight ondemand read
    requests

 fs/cachefiles/daemon.c    |  15 +++-
 fs/cachefiles/interface.c |   7 +-
 fs/cachefiles/internal.h  |  59 +++++++++++++-
 fs/cachefiles/ondemand.c  | 166 ++++++++++++++++++++++++++++----------
 4 files changed, 201 insertions(+), 46 deletions(-)

-- 
2.20.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

