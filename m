Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F656254D7
	for <lists+linux-cachefs@lfdr.de>; Fri, 11 Nov 2022 09:03:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668153783;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=I2oTyYwsMv94bCORMi9spBwr/mnigzuMZqvUHECG9Qc=;
	b=MKuJfVXcX3MFXXFodyLmlmq7+Ja2XVeYba8F3QbBn4IQC+cjEeR/fdaC3K+VtTg3Sufguu
	v8W0ilZf73DiW7K1n8edF/RorV/Aw62MR0B6OzVx4AD9S5Pt0nOeMZCnUiA5B1nI4ZlbHM
	iNa5gWCct1+lL29nOgJ0DH5TmOJfe90=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-55w8dpWUNyqT8qQAxSimfA-1; Fri, 11 Nov 2022 03:03:00 -0500
X-MC-Unique: 55w8dpWUNyqT8qQAxSimfA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7719C8039BA;
	Fri, 11 Nov 2022 08:02:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C721F140EBF5;
	Fri, 11 Nov 2022 08:02:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 42157194658C;
	Fri, 11 Nov 2022 08:02:57 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4561F19465A4 for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  3 Nov 2022 07:37:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 07D454EA49; Thu,  3 Nov 2022 07:37:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 006F239D7C
 for <linux-cachefs@redhat.com>; Thu,  3 Nov 2022 07:37:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D63C18339C5
 for <linux-cachefs@redhat.com>; Thu,  3 Nov 2022 07:37:32 +0000 (UTC)
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-352-Ozqp2kNNN3e98hDB6lVtJQ-1; Thu, 03 Nov 2022 03:37:31 -0400
X-MC-Unique: Ozqp2kNNN3e98hDB6lVtJQ-1
Received: by mail-io1-f70.google.com with SMTP id
 u11-20020a6b490b000000b006bbcc07d893so597467iob.9
 for <linux-cachefs@redhat.com>; Thu, 03 Nov 2022 00:37:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=beK/RyAk6JMkokDhacR9sWsAak3KfcE5cJn8YM9YfXo=;
 b=CZNvkUW997KQxQT2wRwUoggPPDJ49eYQQH42dm5wCHSAS0VDzBCNQm+bCweHDRV+Xv
 YZ+HlKVYAd4Oq8k4tCmQRmpeXmpWRvV7NelhfZahVUFA2U+lv7qw+A8klR2PA2NS9nBi
 jbptP55Y2rBtB2izphmCU6fnYJ4KeIYJtZGcTo6SUlDJYhS0jro+nGgOKDZS690D+Zke
 7harhu1FXrCCkz8V4+JqsM9OjFBDWHPCVu2icU0csXxiU8Ul0YzEntnMq8qgZ8p2BeE6
 hicDyzifGcfx3yaG4M7rJ7xasi81ZRX10FddAg8vyZUJM2QQS/A8iIuVHsgSF2eOgVgI
 3GbQ==
X-Gm-Message-State: ACrzQf1QkQ6NTEjueCwEHSF1uByD8//fKyfXyrnIkpn5p7LAXXEV91eM
 9SDCMYntmGpS40RVXNnnyTa58jRtNQjxpCCEJD2gTHvZ49Sn
X-Google-Smtp-Source: AMsMyM6NRWzlYWEEtCXMvF48SMeGRIEr+NVWFycREnUUEq1I2ewxT3xofAG4HRdEx3hx6lj/gLeQxwJq2WJotVfyS2yP6bKlZYOB
MIME-Version: 1.0
X-Received: by 2002:a6b:f107:0:b0:6d3:a804:75bf with SMTP id
 e7-20020a6bf107000000b006d3a80475bfmr7577135iog.186.1667461050380; Thu, 03
 Nov 2022 00:37:30 -0700 (PDT)
Date: Thu, 03 Nov 2022 00:37:30 -0700
In-Reply-To: <000000000000f2b07b05d5dc87cc@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000095bae005ec8c0759@google.com>
From: syzbot <syzbot+5b129e8586277719bab3@syzkaller.appspotmail.com>
To: dhowells@redhat.com, dvyukov@google.com, linux-cachefs-bounces@redhat.com, 
 linux-cachefs-owner@redhat.com, linux-cachefs@redhat.com, 
 linux-kernel@vger.kernel.org, mudongliangabcd@gmail.com, nogikh@google.com, 
 syzkaller-bugs@googlegroups.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Fri, 11 Nov 2022 08:02:56 +0000
Subject: Re: [Linux-cachefs] [syzbot] general protection fault in
 fscache_free_cookie
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
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This bug is marked as fixed by commit:
fscache: fix GPF in fscache_free_cookie
But I can't find it in any tested tree for more than 90 days.
Is it a correct commit? Please update it by replying:
#syz fix: exact-commit-title
Until then the bug is still considered open and
new crashes with the same signature are ignored.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

