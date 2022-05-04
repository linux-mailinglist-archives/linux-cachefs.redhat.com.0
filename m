Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6A5521106
	for <lists+linux-cachefs@lfdr.de>; Tue, 10 May 2022 11:35:58 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-GyNurVvkNAqP0_ofipOYcg-1; Tue, 10 May 2022 05:35:54 -0400
X-MC-Unique: GyNurVvkNAqP0_ofipOYcg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4497880B716;
	Tue, 10 May 2022 09:35:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8FC7D146870D;
	Tue, 10 May 2022 09:35:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C81EC1947061;
	Tue, 10 May 2022 09:35:50 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 124951947046 for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  4 May 2022 09:15:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D696C400DFA2; Wed,  4 May 2022 09:15:16 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D11DA400DE5E
 for <linux-cachefs@redhat.com>; Wed,  4 May 2022 09:15:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8631F965D22
 for <linux-cachefs@redhat.com>; Wed,  4 May 2022 09:15:16 +0000 (UTC)
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-vbTvX9jiM9m9EPhq-F-jPg-1; Wed, 04 May 2022 05:15:15 -0400
X-MC-Unique: vbTvX9jiM9m9EPhq-F-jPg-1
Received: by mail-io1-f69.google.com with SMTP id
 c25-20020a5d9399000000b00652e2b23358so606883iol.6
 for <linux-cachefs@redhat.com>; Wed, 04 May 2022 02:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=beK/RyAk6JMkokDhacR9sWsAak3KfcE5cJn8YM9YfXo=;
 b=GcTwyB+IJ8QRPtgBi18z9jERtm5k7LQ9wjpmJzhxptqDkFvBcsyHu1wLdioiU3qpOE
 zimh0joTcaehqg0FfVK1a4hnl8HYJeV7qLgc2n8zFQqu80hMS8eYkdQ31g9Jo0CrZvq1
 bNtZYsL0drkVVEpUne8P9yzolqNQc2dyb2B3pHk6WWhLPbzro6AYrjk4LVNVdacRYMeJ
 MV8CTF48x1SX3dii8VXHC5GXHbrHAm72B5oAs0LLr+jgHaY94tqWDvNwMvups9I/U5Sf
 LqM2xR+pAz7UYvuyoudkrXh0eU29ECaroFR57mn/9X/GoLR8h2Och2hJgLabrJuwn7L/
 6NCA==
X-Gm-Message-State: AOAM532c6TsR+qsKXrflaEKFgRIV2BUZR4DhOV9sHS5iXlrzzdpvp2/i
 X0L3k6U0uZmH7beUumR4GLJG5FVyn06x7ZE6OfQTUkGjqYB5
X-Google-Smtp-Source: ABdhPJxttq7avaGELU4BmNcisd2cCdBbhhtvLjh75B538RWU2YaKgmnsBhCoBcLJkQWt5aBSQ2E1Ter+xblfk0DaPVHIWpD1e0Hv
MIME-Version: 1.0
X-Received: by 2002:a05:6638:164b:b0:323:ac42:8d4b with SMTP id
 a11-20020a056638164b00b00323ac428d4bmr8709404jat.75.1651655714399; Wed, 04
 May 2022 02:15:14 -0700 (PDT)
Date: Wed, 04 May 2022 02:15:14 -0700
In-Reply-To: <000000000000f2b07b05d5dc87cc@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000025ef7405de2c101d@google.com>
From: syzbot <syzbot+5b129e8586277719bab3@syzkaller.appspotmail.com>
To: dhowells@redhat.com, linux-cachefs-bounces@redhat.com, 
 linux-cachefs-owner@redhat.com, linux-cachefs@redhat.com, 
 linux-kernel@vger.kernel.org, mudongliangabcd@gmail.com, 
 syzkaller-bugs@googlegroups.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mailman-Approved-At: Tue, 10 May 2022 09:35:50 +0000
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
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

