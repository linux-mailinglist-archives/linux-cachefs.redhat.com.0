Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAF352B66B
	for <lists+linux-cachefs@lfdr.de>; Wed, 18 May 2022 11:39:57 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-rBrXgavFMV2eTiVBQ3J2gQ-1; Wed, 18 May 2022 05:39:53 -0400
X-MC-Unique: rBrXgavFMV2eTiVBQ3J2gQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 850F11D33862;
	Wed, 18 May 2022 09:39:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7B3B7492C3B;
	Wed, 18 May 2022 09:39:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1DDA31947B91;
	Wed, 18 May 2022 09:39:52 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8A8591947B84 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 18 May 2022 09:15:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 531A01410F37; Wed, 18 May 2022 09:15:27 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FA2B1410F36
 for <linux-cachefs@redhat.com>; Wed, 18 May 2022 09:15:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37AB01C08968
 for <linux-cachefs@redhat.com>; Wed, 18 May 2022 09:15:27 +0000 (UTC)
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-nHdVYZBVP52cJ3ASaf09HA-1; Wed, 18 May 2022 05:15:23 -0400
X-MC-Unique: nHdVYZBVP52cJ3ASaf09HA-1
Received: by mail-io1-f71.google.com with SMTP id
 e10-20020a056602158a00b0065a9bede1c4so14083680iow.8
 for <linux-cachefs@redhat.com>; Wed, 18 May 2022 02:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=beK/RyAk6JMkokDhacR9sWsAak3KfcE5cJn8YM9YfXo=;
 b=cod1F0XLjW2jFQKsGZct+3+tLknupED9emMo7sRYrBeQwBpK2EHr0aKfBGfc1MDvqJ
 6+gha/Ol5Fd0hRk9WYrdd4Sf4T+HHM1ZJxtTg7coxahpoDDpLGn9cCMI3d+YqFDpT6D2
 cxTGF4wMYsIA8biCvp9T6esiOlEcPSS6NrLtlas+PJjHqdt3817vfySxMn1NF/gYrMaw
 IxWAWPOvv71dGQHcbHBvsyq6WxBl/DFlVvNoNzsJDKXn0Ll76Y88Q3Oobf6dStwgY41o
 rOQ6dZRYWTs2Vg1/o/byIV93Uzm3Ppaw1D0s7cd5afUvdwM4okOxv90vsnFNvitGEudb
 sVZQ==
X-Gm-Message-State: AOAM532w1/GWy6VVJVs4/ZRo9nBiaeAX17CzR7Zq8p7TXGynAjuyIzk2
 6aQJs9colapSbnuAuKlCH8jxUpfmhiLjs4c6QrN9UGdxq3Xk
X-Google-Smtp-Source: ABdhPJwt3FmoutrzsR+CsxDMxj/k4tujVOEsXNvPIF709dM07yn4rtyCh7r50mBFGtbTVUq1qQySxrLJcDlVhEYCEjc/cJ/YcyS+
MIME-Version: 1.0
X-Received: by 2002:a05:6638:411d:b0:32b:7465:fee2 with SMTP id
 ay29-20020a056638411d00b0032b7465fee2mr15097962jab.318.1652865322948; Wed, 18
 May 2022 02:15:22 -0700 (PDT)
Date: Wed, 18 May 2022 02:15:22 -0700
In-Reply-To: <000000000000f2b07b05d5dc87cc@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006f9dbc05df45b23b@google.com>
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mailman-Approved-At: Wed, 18 May 2022 09:39:50 +0000
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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

