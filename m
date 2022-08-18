Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA435984B9
	for <lists+linux-cachefs@lfdr.de>; Thu, 18 Aug 2022 15:52:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660830766;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JdUPlp+OV1WWm5LOW6bQUz/HJMgiUOMUA2IbXPc/g14=;
	b=dk6j7nml2hcgnbCS1QvkV1SBM5HCSlX6zsnUVSFhaTXazaL2nj/luJBZP7TGlbsmzmF2iV
	+q8uE/5H3GmbgEn4mF0SwoF53sY0hrvR9bCNrr6Y9/zK5e9bdfznDbASMQuVU0SDmpW9JC
	4Rm7oO5UDEwYAswmDrUFttz9jibl6gQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-McFlKD-VPK6xN295sbsUVw-1; Thu, 18 Aug 2022 09:52:44 -0400
X-MC-Unique: McFlKD-VPK6xN295sbsUVw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56B863C01DEA;
	Thu, 18 Aug 2022 13:52:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4CC5E9458A;
	Thu, 18 Aug 2022 13:52:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2416D194E11C;
	Thu, 18 Aug 2022 13:52:43 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 964211946A41 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 18 Aug 2022 13:52:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5C42640D282E; Thu, 18 Aug 2022 13:52:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 57F0340D2827
 for <linux-cachefs@redhat.com>; Thu, 18 Aug 2022 13:52:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3FAB7293248D
 for <linux-cachefs@redhat.com>; Thu, 18 Aug 2022 13:52:41 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-160-pP6khhF2N8iobkd0oKzFBA-1; Thu, 18 Aug 2022 09:52:39 -0400
X-MC-Unique: pP6khhF2N8iobkd0oKzFBA-1
Received: by mail-pg1-f181.google.com with SMTP id s206so1355601pgs.3
 for <linux-cachefs@redhat.com>; Thu, 18 Aug 2022 06:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=JIt9Hr3bnXwA/tRzFdUUjJF8ICdMOLH9UGftglFwKs0=;
 b=fw/LD5cdGdZcF/qPBc6xTk/sq37skw0mgIupp3KYB4Y3FposM6rtmq6NI9rceMsM+W
 CjWTJN3CjNc4oNm2jUJi8IX2F7lX0ejK6Stu626o8+KTSXYUc9bHHkSlfOLoRDaMkKpd
 iZw7yb6aqoiThmxGH1KhY1DiNr/dUVD7IACipT6IDE7z6MUeIXVQ0FFPCt9qQcoC2Kg/
 bWvMqjAdnqfndQW7BasDlYgpkLvte1QOqylfHAfDTbOOzvj1oyf2xybcBjnhfs+D0jE8
 /lhyTwzd60r+M3K9MwmhWLAdAxQAkV8c662Ek1fvWaurUzWBh96PA2Wy4rcU7aQKdgUf
 SzcQ==
X-Gm-Message-State: ACgBeo093WD5vMypxvlGH3jX2dSsGF632LSaeCu3q0sjLfqg+CbvKzoS
 mC2xjq/aaGs8DHNQ0TCwFJ7LCw==
X-Google-Smtp-Source: AA6agR7dyQJ+ORPyUmexb/HyRV/vRty6JE9R9UJyqOx4rKaS8Fn0kNA5WBhPQP1h+roc/IdDaQXkGQ==
X-Received: by 2002:a63:698a:0:b0:41c:8dfa:e622 with SMTP id
 e132-20020a63698a000000b0041c8dfae622mr2473637pgc.465.1660830758358; 
 Thu, 18 Aug 2022 06:52:38 -0700 (PDT)
Received: from C02G705SMD6V.bytedance.net ([139.177.225.242])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a170902ce1100b0016db0d877e4sm1385697plg.221.2022.08.18.06.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 06:52:37 -0700 (PDT)
From: Jia Zhu <zhujia.zj@bytedance.com>
To: dhowells@redhat.com,
	xiang@kernel.org,
	jefflexu@linux.alibaba.com
Date: Thu, 18 Aug 2022 21:51:59 +0800
Message-Id: <20220818135204.49878-1-zhujia.zj@bytedance.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Linux-cachefs] [RFC PATCH 0/5] Introduce daemon failover mechanism
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
Cc: Jia Zhu <zhujia.zj@bytedance.com>, linux-kernel@vger.kernel.org,
 linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

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
https://github.com/userzj/linux/tree/fscache-failover-v1

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
 fs/cachefiles/internal.h  |  74 ++++++++++++++++++++-
 fs/cachefiles/ondemand.c  | 135 ++++++++++++++++++++++++++++----------
 4 files changed, 193 insertions(+), 36 deletions(-)

-- 
2.20.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

