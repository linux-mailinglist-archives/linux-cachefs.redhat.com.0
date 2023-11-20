Return-Path: <linux-cachefs+bncBDKYBHUEQUPBBXN25OVAMGQEZKI6YYY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mail.lfdr.de (Postfix) with ESMTPS id F393B7F0B3B
	for <lists+linux-cachefs@lfdr.de>; Mon, 20 Nov 2023 05:15:26 +0100 (CET)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-679dfc91beasf2527186d6.1
        for <lists+linux-cachefs@lfdr.de>; Sun, 19 Nov 2023 20:15:26 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700453726; cv=pass;
        d=google.com; s=arc-20160816;
        b=EBaaji2wMNZoaxwPg1ZMfGzP4Uy0HksshR2hxN8qHr8OfG1ZtibEokuvjepzkY0BYU
         +qhcBpTgUlEADs5zNI7IUyclB0Ffe5MtjMm5vqJDEmcg9XPz9aaw2vEewMIfgUbaZfrs
         lGtuW/Q5zYAaSV2E8xX+No+4djqlmmIZWZsf49+aObmNkrsyJgOtqljbFzToiEAPyCWq
         YRFL6r/EriMooiIKf5jimcsxldR4zKOGWOeo4ksGYkPIjYGsJN+psFvRdZKFNn6PIlJ1
         dRUebUIXhjD5XC7rEdE7aH35BFv+PIGIBImDpwhVVJOyXv8TYIuES/pVBqWBEtRGtojL
         QCmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:reply-to:mime-version:message-id:date
         :subject:cc:to:from:delivered-to;
        bh=NSJlv0/ix5HJwv9LQtiDgVe+/5BD69NjvwsM24CpjRQ=;
        fh=2MjqSmE/Flr/Azt/mtnMNhZyMmjsqHVSxMPyjqy6YHI=;
        b=RNE89qamX4E0p+ATx27yFEV8E0xiTkPmx7hTcS/WbIlvpnTTmUKXWdq7TeSyF/5/uK
         5oV3GTOO6IYLBKSK55LcMb1HgXiEuLKabIeZcqKHyES37K4+9GYcCdotTG6DHXSzc1zS
         Fdh3M4PLmm4lgV61uzlf6Od/3wdTirk+5k69MCrIuvYaXyEwiI3qjyncMBQTLVOS8LKJ
         UQ7R4nTGnTaAjDltXWSBC1GOJHsaypHyHwQZ8+G4tmDKYw7c8JMh14F8AiGvTgFmdUYQ
         6YK76w3oE1NGPJDNFw2HT2Z7UpJ/jbaBxLOd3DdfvBONfOhF6MvT1+rPoSOAzRNURT7J
         6vhg==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain of zhujia.zj@bytedance.com designates 209.85.210.175 as permitted sender) smtp.mailfrom=zhujia.zj@bytedance.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700453726; x=1701058526;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender:mime-version
         :message-id:date:subject:cc:to:from:delivered-to:x-beenthere
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NSJlv0/ix5HJwv9LQtiDgVe+/5BD69NjvwsM24CpjRQ=;
        b=LCP/5NX9EOAipaReYxKkfCP7QY6R3xK9nfqZ7IUaR/5ghEY0GB3SeZA982ko4A62fB
         nWz6nQwOUcwiXwOm+t40T3k7EWxNBS5MwbzZX8w2ISIEwt5wGqxJhv72Niq5BjRRTvyf
         mT+ifdYJw5KcpARNRy2lH6cG/hkXXyLsCRplVqI5PsE7Q61dTUctUBLbdCSi32DytH/u
         64n/uUy79HIf0rWAfYSL1wq43ZCXRXPrRRou8CN67pMUGf7oS2PsBaaECwLAWuysfmrH
         P1D9sux7hHUY5AoXX7H6koupX28xmMipg3oFdOLv8aAaMyQys88K8fN3I4qz594M3D8P
         xpYQ==
X-Gm-Message-State: AOJu0YxtOEQ7YAD83l5gFzGN5FxFLIUGH3Yvv7YBX6efH9FUdunJ2hKd
	t9aaS60X+Zdvg5jDh8AUv1ACpg==
X-Google-Smtp-Source: AGHT+IHLZw+pA9wSY0F73zTI0aK9KR2laJRZ/VQIkNjtYhV+UY84k11b3XLIrE4cItEixoQy85p/6A==
X-Received: by 2002:a0c:e210:0:b0:66d:37bc:bb91 with SMTP id q16-20020a0ce210000000b0066d37bcbb91mr7252176qvl.56.1700453725870;
        Sun, 19 Nov 2023 20:15:25 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a0c:eed4:0:b0:66d:9d16:5a4c with SMTP id h20-20020a0ceed4000000b0066d9d165a4cls1511579qvs.1.-pod-prod-03-us;
 Sun, 19 Nov 2023 20:15:25 -0800 (PST)
X-Received: by 2002:ad4:574f:0:b0:679:2f93:9e4e with SMTP id q15-20020ad4574f000000b006792f939e4emr6912581qvx.31.1700453725012;
        Sun, 19 Nov 2023 20:15:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700453724; cv=none;
        d=google.com; s=arc-20160816;
        b=Fq21Fsi3njtEaPpvaKUUaM8dOvly84j3kCIleyfPwHNQumzDKOPn5l5UuDvU1o8NYB
         /BMYt27hSX0TybQhSxQA8uiNrjo52e0td23TMe2BjqD43/uqIYHJSdFksMFzwG96j/Ig
         pnQYgpFInpDiyYuYRu8gQWONPM9LaYwoGFintosqHWFTu1uLAOmE3ww8MNjohm0gRDVY
         k1UtUExpVAuTo/rCmQhpxTgYJHGZsJ4KserCmPA72kuBWE9YnwedBtREd/kyD8LRfe0Q
         E+w2X8+LsePOsxN6d1TAlQcfUiJa3NWgWCxi+d62X+syBl/6AvHKEAT8qKEEvq1rJp82
         nyfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:delivered-to;
        bh=nIDTyvDZmEbG+Yu+hBrCT0MY3hx+Ko8aN1HuoFlM3pE=;
        fh=2MjqSmE/Flr/Azt/mtnMNhZyMmjsqHVSxMPyjqy6YHI=;
        b=uRHoFaUb/+LUSUcm2jstwZiiY5VNxpR8dL49E+L3U88SBnLQ/gEOUSMUAtJ879eFJH
         d0bTjD9RqB3bT1GXnUcubpEUSpGzwdyYWh4a1J425WjAGzMYPfgvtqkTBxfxMG49oGt2
         9lKWqbABdF9XuHEa8e+blqqvtiKvI3jPeOf+cEs48gu4sp6ui8ZB2HGwseGK+LzL/1c/
         4gA9H2w8aV24Hhpzluq2foLlKNcENdVkc9mW2Q0SLmL6pZUNpbUWb2RlhVW8X9GTOD+r
         SYRyT06eXz6RLK1xSOqKr4EZELQqLaxHT070yIzk3/RyvWwxkgND4lEW4ygw+7woBcB1
         9xDg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of zhujia.zj@bytedance.com designates 209.85.210.175 as permitted sender) smtp.mailfrom=zhujia.zj@bytedance.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id er9-20020a056214190900b0067804dbc00asi3590889qvb.232.2023.11.19.20.15.24
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 20:15:24 -0800 (PST)
Received-SPF: pass (google.com: domain of zhujia.zj@bytedance.com designates 209.85.210.175 as permitted sender) client-ip=209.85.210.175;
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-463-YwG9lyFkN9Oj91sptHeWDA-1; Sun, 19 Nov 2023 23:15:23 -0500
X-MC-Unique: YwG9lyFkN9Oj91sptHeWDA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CFC8814084
	for <linux-cachefs@gapps.redhat.com>; Mon, 20 Nov 2023 04:15:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 69ADBC15983; Mon, 20 Nov 2023 04:15:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 61EDAC1596F
	for <linux-cachefs@redhat.com>; Mon, 20 Nov 2023 04:15:23 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F9B338062A4
	for <linux-cachefs@redhat.com>; Mon, 20 Nov 2023 04:15:23 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-O_sE7A9YMQam_lEw6LHtcg-1; Sun, 19 Nov 2023 23:15:21 -0500
X-MC-Unique: O_sE7A9YMQam_lEw6LHtcg-1
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6b1d1099a84so3842181b3a.1
        for <linux-cachefs@redhat.com>; Sun, 19 Nov 2023 20:15:21 -0800 (PST)
X-Received: by 2002:a05:6a20:1612:b0:187:f22b:8037 with SMTP id l18-20020a056a20161200b00187f22b8037mr7742380pzj.52.1700453720117;
        Sun, 19 Nov 2023 20:15:20 -0800 (PST)
Received: from C02G705SMD6V.bytedance.net ([61.213.176.5])
        by smtp.gmail.com with ESMTPSA id h18-20020a170902f7d200b001cc4e477861sm5065266plw.212.2023.11.19.20.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 20:15:19 -0800 (PST)
From: "'Jia Zhu' via linux-cachefs@redhat.com" <linux-cachefs@redhat.com>
To: dhowells@redhat.com,
	linux-cachefs@redhat.com
Cc: linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jefflexu@linux.alibaba.com,
	hsiangkao@linux.alibaba.com,
	Jia Zhu <zhujia.zj@bytedance.com>
Subject: [PATCH V6 RESEND 0/5] cachefiles: Introduce failover mechanism for on-demand mode
Date: Mon, 20 Nov 2023 12:14:17 +0800
Message-Id: <20231120041422.75170-1-zhujia.zj@bytedance.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection Definition;Similar Internal Domain=false;Similar Monitored External Domain=false;Custom External Domain=false;Mimecast External Domain=false;Newly Observed Domain=false;Internal User Name=false;Custom Display Name List=false;Reply-to Address Mismatch=false;Targeted Threat Dictionary=false;Mimecast Threat Dictionary=false;Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: zhujia.zj@bytedance.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain of zhujia.zj@bytedance.com designates 209.85.210.175 as permitted
 sender) smtp.mailfrom=zhujia.zj@bytedance.com
X-Original-From: Jia Zhu <zhujia.zj@bytedance.com>
Reply-To: Jia Zhu <zhujia.zj@bytedance.com>
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

Changes since v5:
In cachefiles_daemon_poll(), replace xa_for_each_marked with xas_for_each_marked.

[Background]
============
In the on-demand read mode, if user daemon unexpectedly closes an on-demand fd
(for example, due to daemon crashing), subsequent read operations and inflight
requests relying on these fd will result in a return value of -EIO, indicating
an I/O error.
While this situation might be tolerable for individual personal users, it
becomes a significant concern when it occurs in a real public cloud service
production environment (like us).  Such I/O errors will be propagated to cloud
service users, potentially impacting the execution of their jobs and
compromising the overall stability of the cloud service.  Besides, we have no
way to recover this.

[Design]
========
The main concept behind daemon failover is to reopen the inflight request-related
objects so that the newly started daemon can process the requests as usual. 
To achieve this, certain requirements need to be met:
1. Storing inflight requests during a daemon crash:
   It is necessary to have a mechanism in place to store the inflight
   requests while the daemon is offline or during a crash. This ensures
   that the requests are not lost and can be processed once the daemon
   is up and running again.
2. Holding the handle of /dev/cachefiles:
   The handle of /dev/cachefiles should be retained, either by the container
   snapshotter or systemd, to facilitate the failover process. This allows
   the newly started daemon to access the necessary resources and continue
   processing the requests seamlessly.

It's important to note that if the user chooses not to keep the /dev/cachefiles
fd, the failover feature will not be enabled. In this case, inflight requests
will return error, which will be passed on to the container, maintaining the same
behavior as the current setup.

By implementing these mechanisms, the failover system ensures that inflight requests
are not lost during a daemon crash and that the newly started daemon can resume
its operations smoothly, providing a more robust and reliable service for users.

[Flow Path]
===========
This patchset introduce three states for ondemand object:
CLOSE: This state represents an object that has either just been allocated or
	   closed by the user daemon.
OPEN: This state indicates that the object is open and ready for processing.
	  It signifies that the related OPEN request has been successfully handled
	  and the object is available for read operations or other interactions.
REOPENING: This state is assigned to an object that has been previously closed
	  but is now being driven to reopen due to a read request. The REOPENING state
	  indicates that the object is in the process of being reopened, preparing
	  for subsequent read operations.

1. The daemon utilizes Unix Domain Sockets (UDS) to send and receive fd in order to
   maintain and pass the reference to "/dev/cachefiles".

2. In the event of a user daemon crash, the daemon is restarted and the reference
   to the file descriptor for "/dev/cachefiles" is recovered.

3. The user daemon writes "restore" to the device, triggering the following actions:
   3.1. The object's state is reset from CLOSE to REOPENING, indicating that it
        is in the process of reopening.
   3.2. A work unit is initialized, which reinitializes the object and adds it to
        the work queue. This allows the daemon to handle the open request,
        transitioning from kernel space to user space.

4. As a result of these recovery mechanisms, the user of the upper filesystem
   remains unaware of the daemon crash. The inflight I/O operations are restored
   and correctly handled, ensuring that the system operates seamlessly without
   any noticeable disruptions.

By implementing these steps, the system achieves fault tolerance by recovering and
restoring the necessary references and states, ensuring the smooth functioning of
the user daemon and providing a seamless experience to the users of the upper filesystem.

[GitWeb]
========
https://github.com/userzj/linux/tree/fscache-failover-v6

RFC: https://lore.kernel.org/all/20220818135204.49878-1-zhujia.zj@bytedance.com/
V1: https://lore.kernel.org/all/20221011131552.23833-1-zhujia.zj@bytedance.com/
V2: https://lore.kernel.org/all/20221014030745.25748-1-zhujia.zj@bytedance.com/
V3: https://lore.kernel.org/all/20221014080559.42108-1-zhujia.zj@bytedance.com/
V4: https://lore.kernel.org/all/20230111052515.53941-1-zhujia.zj@bytedance.com/
V5: https://lore.kernel.org/all/20230329140155.53272-1-zhujia.zj@bytedance.com/

[Test]
======
There are testcases for above mentioned scenario.
A user process read the file by fscache on-demand reading.
At the same time, we kill the daemon constantly.
The expected result is that the file read by user is consistent with
original, and the user doesn't notice that daemon has ever been killed.

https://github.com/userzj/demand-read-cachefilesd/commits/failover-test

In addition, this patchset has also been merged in our downstream kernel
for almost one year as out-of-tree patches for real production use.
Therefore, we hope it could be landed upstream too.

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
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

