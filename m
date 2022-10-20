Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8426C610461
	for <lists+linux-cachefs@lfdr.de>; Thu, 27 Oct 2022 23:28:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666906099;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=I2oTyYwsMv94bCORMi9spBwr/mnigzuMZqvUHECG9Qc=;
	b=gix3RqQOWtbmrr7w2iCr2RQI+AFVQY1sJpHfcsB+fDYsUTJKfeJY1XrvFE3LyuSvdt9Pym
	v4XBuDFIcJttkhfvIE3xDg29eOr7UCp2IXUzibwCyot0bjt02PXV31fAIPWyUyyF83+VrM
	UH4JrbPqnXydQb4+Z1tQ9EETh2REaM4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-2wjzdexuN1iMqw_pq7Oang-1; Thu, 27 Oct 2022 17:28:16 -0400
X-MC-Unique: 2wjzdexuN1iMqw_pq7Oang-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B46585A59D;
	Thu, 27 Oct 2022 21:28:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 217FAC15BA8;
	Thu, 27 Oct 2022 21:28:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CCAA1194704E;
	Thu, 27 Oct 2022 21:28:11 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7DC8C1946595 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 20 Oct 2022 07:36:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2A0754047A4; Thu, 20 Oct 2022 07:36:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 229AD403163
 for <linux-cachefs@redhat.com>; Thu, 20 Oct 2022 07:36:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 040DD29AB405
 for <linux-cachefs@redhat.com>; Thu, 20 Oct 2022 07:36:34 +0000 (UTC)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-437-Nw0CFnxRNDerEPLrg49wtQ-1; Thu, 20 Oct 2022 03:36:32 -0400
X-MC-Unique: Nw0CFnxRNDerEPLrg49wtQ-1
Received: by mail-il1-f199.google.com with SMTP id
 n14-20020a056e02100e00b002f9e283e850so19484103ilj.9
 for <linux-cachefs@redhat.com>; Thu, 20 Oct 2022 00:36:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=beK/RyAk6JMkokDhacR9sWsAak3KfcE5cJn8YM9YfXo=;
 b=ouIPC4mEwBgKMrmcGhLMvCPdf2AbCq0eRVNYc9GzvO+Gvb4Bti0ut03bmvqY1+Qj+L
 GHaMtpuenG7wMzVaQJVbeAH2/CAyXJ4ylBMe8PpW+9o80R0Wg1+K1JSM1FE9QM5MsCQF
 7+yOR6IEPY/yjwf+3gr2K2gAh7Z+Zj7WkqrqONY4i+70OeClaGTo7THtDbml1uynwihA
 gAChaFOWwxfiJ5aeUam2pYGNEGSUwIisEozrJqGhge7YraDDwmdB/rJDYb3H9iv/Kz6p
 Q4idl7Pweq22g/u+qb1Rf9zriwgbkPVpO0YJfLHijyLzZ8pomwTgxTjcEvjSsPTa6pyK
 9nUw==
X-Gm-Message-State: ACrzQf2N+aXM//5YHoHiz3segHns2tkM3YLUpsRDIgZi1dJhb7SCPTXX
 wKvzG/JK0o2YQwBT416qMAEogeNfNhMBUX5Trc57Tu1T2IMx
X-Google-Smtp-Source: AMsMyM6lPwgj4Q3DvjBnp+fA4UBjMmmzDlSR0FOvw5VDPgORiz2X3QYKE3lMgf1h1krXbr1FvKl8b7UL+ome8+zH7iGCIHYV/akz
MIME-Version: 1.0
X-Received: by 2002:a92:d28b:0:b0:2f9:95e5:fae6 with SMTP id
 p11-20020a92d28b000000b002f995e5fae6mr9067829ilp.313.1666251391412; Thu, 20
 Oct 2022 00:36:31 -0700 (PDT)
Date: Thu, 20 Oct 2022 00:36:31 -0700
In-Reply-To: <000000000000f2b07b05d5dc87cc@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004ab16105eb726264@google.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Thu, 27 Oct 2022 21:28:10 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

