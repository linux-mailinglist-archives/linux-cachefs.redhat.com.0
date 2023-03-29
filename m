Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF856CDB6D
	for <lists+linux-cachefs@lfdr.de>; Wed, 29 Mar 2023 16:02:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680098576;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AQdZ09OtC7foKEYNkG0zfzDWhEhEMaok6EpZb0esCrc=;
	b=W9cDLOw5150kpUGk7ZrfJCTnMEIN5RO0uhAxUqIQog0n5vbsXbyRgvi+Rc15a+IL2IVR0a
	8v4e328aMrOEF2ctoNXaCWY7R6+kqrVKj67bDlmzBXnYdsMZfhLIkJT6XQjoyFZmx/ZJqf
	yvh5nNgA2KMJgVmntSQb7OshnxFI8HI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-F5ZQLgiHPX6xRhm-E0vvRA-1; Wed, 29 Mar 2023 10:02:55 -0400
X-MC-Unique: F5ZQLgiHPX6xRhm-E0vvRA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 612831C041B6;
	Wed, 29 Mar 2023 14:02:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A303AC15BB8;
	Wed, 29 Mar 2023 14:02:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0E27D194658D;
	Wed, 29 Mar 2023 14:02:51 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2B0D71946587 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 29 Mar 2023 14:02:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0C3B8492B01; Wed, 29 Mar 2023 14:02:16 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 051B8492C3E
 for <linux-cachefs@redhat.com>; Wed, 29 Mar 2023 14:02:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF014185A791
 for <linux-cachefs@redhat.com>; Wed, 29 Mar 2023 14:02:15 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-4ZDaIjHQOuO__pwXYTaoOA-2; Wed, 29 Mar 2023 10:02:14 -0400
X-MC-Unique: 4ZDaIjHQOuO__pwXYTaoOA-2
Received: by mail-pf1-f178.google.com with SMTP id b7so239698pfv.2
 for <linux-cachefs@redhat.com>; Wed, 29 Mar 2023 07:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680098533;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4uvssyWsx3k7MHrKeBtfOfjBMlx3rM4q3Jp1ubBODfw=;
 b=1bqv3E8uESMUX8F5wrpOsKBFTuyRU/eXz4C1aqoz/EZQ3WHC6tXTODBPhinS16HE8d
 0yLAObQ+Ulu5nxHfXuPqYtiaJIhQgcz6SeLW3hucRv/DMjsdq4yUBJ0LD5zylhQ5sqfP
 I4pxW8fKaZczxtnNwjvmVNYBttqWun/2aQIrzWGVwRnp8YgeGcKp19QxjO1S17uQDfAx
 ADtloGTtP5LjMmp8NXPVSL19s48Ch7BLPAAfc8RZEdlqb+O4OAkEkNEnHdoUf/D2ORGo
 SYq0D7sTzMXJUkgqj5KPtX+iiPM9twj8yUe8C+wFSoWc4Vn52Yfe+El9cj+qkZh0uP2u
 6oQw==
X-Gm-Message-State: AAQBX9f9zJwcZ/qh8EI+leIrlx7ofqvt287H+Ahb6S2aND/pVWu2ooPm
 WSzZu7E30Jz0C+DxzM0HDsxsug==
X-Google-Smtp-Source: AKy350Zu7f5eX6mOVbKMD+sOv6QkyLwxP6u50C0/15Nu8mhq7u6EIcFAOwM6F9nrt/UGfUx/Cec5dQ==
X-Received: by 2002:a62:190d:0:b0:628:aa3:82bc with SMTP id
 13-20020a62190d000000b006280aa382bcmr15683522pfz.18.1680098533403; 
 Wed, 29 Mar 2023 07:02:13 -0700 (PDT)
Received: from C02G705SMD6V.bytedance.net ([61.213.176.14])
 by smtp.gmail.com with ESMTPSA id
 y17-20020aa78051000000b006288ca3cadfsm5399468pfm.35.2023.03.29.07.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 07:02:13 -0700 (PDT)
From: Jia Zhu <zhujia.zj@bytedance.com>
To: dhowells@redhat.com,
	linux-cachefs@redhat.com
Date: Wed, 29 Mar 2023 22:01:50 +0800
Message-Id: <20230329140155.53272-1-zhujia.zj@bytedance.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Linux-cachefs] [PATCH V5 0/5] Introduce daemon failover mechanism
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
Cc: linux-kernel@vger.kernel.org, linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Changes since v3:
1. Make enum cachefiles_object_state to all-uppercase and optimize the implement
   of CACHEFILES_OBJECT_STATE_FUNCS.
2. For struct cachefiles_object:
	1. Make ondemand field inside of "#ifdef CONFIG_CACHEFILES_ONDEMAND".
	2. Rename struct cachefiles_ondemand_info *private to *ondemand.
3. In ondemand_object_worker():
	1. Replace type casting with container_of().
	2. Remove useless "else".
4. In cachefiles_daemon_poll(), replace xa_(un)lock with rcu_read_(un)lock.

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
https://github.com/userzj/linux/tree/fscache-failover-v5

RFC: https://lore.kernel.org/all/20220818135204.49878-1-zhujia.zj@bytedance.com/
V1: https://lore.kernel.org/all/20221011131552.23833-1-zhujia.zj@bytedance.com/
V2: https://lore.kernel.org/all/20221014030745.25748-1-zhujia.zj@bytedance.com/
V3: https://lore.kernel.org/all/20221014080559.42108-1-zhujia.zj@bytedance.com/
V4: https://lore.kernel.org/all/20230111052515.53941-1-zhujia.zj@bytedance.com/

Jia Zhu (5):
  cachefiles: introduce object ondemand state
  cachefiles: extract ondemand info field from cachefiles_object
  cachefiles: resend an open request if the read request's object is
    closed
  cachefiles: narrow the scope of triggering EPOLLIN events in ondemand
    mode
  cachefiles: add restore command to recover inflight ondemand read
    requests

 fs/cachefiles/daemon.c    |  16 +++-
 fs/cachefiles/interface.c |   7 +-
 fs/cachefiles/internal.h  |  59 +++++++++++++-
 fs/cachefiles/ondemand.c  | 166 ++++++++++++++++++++++++++++----------
 4 files changed, 202 insertions(+), 46 deletions(-)

-- 
2.20.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

