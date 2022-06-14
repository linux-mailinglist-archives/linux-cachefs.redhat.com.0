Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A6B54A983
	for <lists+linux-cachefs@lfdr.de>; Tue, 14 Jun 2022 08:34:52 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-gwGetracNDakoU_blwqgiw-1; Tue, 14 Jun 2022 02:34:48 -0400
X-MC-Unique: gwGetracNDakoU_blwqgiw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA21685A583;
	Tue, 14 Jun 2022 06:34:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 789A0C28115;
	Tue, 14 Jun 2022 06:34:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5975C1947070;
	Tue, 14 Jun 2022 06:34:46 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A2F701947067 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 14 Jun 2022 06:34:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8206810725; Tue, 14 Jun 2022 06:34:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D1959D7F
 for <linux-cachefs@redhat.com>; Tue, 14 Jun 2022 06:34:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62A5A801E6B
 for <linux-cachefs@redhat.com>; Tue, 14 Jun 2022 06:34:44 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-66-gJzaUgK7PN2UC4qEifriWQ-1; Tue, 14 Jun 2022 02:34:41 -0400
X-MC-Unique: gJzaUgK7PN2UC4qEifriWQ-1
Received: by mail-pf1-f181.google.com with SMTP id i64so7752450pfc.8
 for <linux-cachefs@redhat.com>; Mon, 13 Jun 2022 23:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:references:to:cc:in-reply-to:content-transfer-encoding;
 bh=+jAhLK+0fRHMqQ7qoZz//CDul2lnBSp2wfTG4W3TRQY=;
 b=Bo/RMhzSNNO0Z807UVlkA6+X7w1JFWVmhWFNJAKr9nZFz7V/AVeg/NEIMylpY4gtlo
 txFEh3l7S2QPh5kpMOGPC/S/qRhyVSvycVMhm2re2Gmddx7zILwSny5jH3ZtsMkI1fo2
 zzT8rMG/MDRMitB1McZKtiQi+W2+ot9NACPLYG11wN4Dq8+QTQ5UFcv0Fbr+KwwqUzxu
 RIkdKYciVCBZR9bhhI0Ya3tmKESTpvS5QxYeXEaNI243Fj4czHpm3DYiPlViecLfNQUH
 1s/VYRQvVKylnsHzWXhF+FyBCM52zPUhawYUAHZgl2GLgujMnGlh1vfwkyGPoJdiPzct
 +0FQ==
X-Gm-Message-State: AOAM530l8IH8wqB2HkrLn1OD+u62QjloAsV8lP7riiu3plwhtNrc//IF
 LEotx/GMiSca9MUNx8vw7GzMIQ==
X-Google-Smtp-Source: ABdhPJwI8ptLculCXHH09zaUTB4/GIyuPN6zhr0t2oVTtpjjxCMh96Fh9i44Mib1GeyNhURAH8gs1Q==
X-Received: by 2002:a05:6a00:a21:b0:522:9134:c620 with SMTP id
 p33-20020a056a000a2100b005229134c620mr2891196pfh.68.1655188480394; 
 Mon, 13 Jun 2022 23:34:40 -0700 (PDT)
Received: from [10.4.226.233] ([139.177.225.232])
 by smtp.gmail.com with ESMTPSA id
 x16-20020a1709027c1000b0015e8d4eb276sm6277288pll.192.2022.06.13.23.34.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 23:34:40 -0700 (PDT)
Message-ID: <0ccf0d41-f080-5dde-6afb-5957e2d92a39@bytedance.com>
Date: Tue, 14 Jun 2022 14:34:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
From: Jia Zhu <zhujia.zj@bytedance.com>
References: <98ac6b1a-1c63-65ab-d315-7a1e38cef46f@bytedance.com>
To: dhowells@redhat.com, Jeffle Xu <jefflexu@linux.alibaba.com>,
 xiang@kernel.org
In-Reply-To: <98ac6b1a-1c63-65ab-d315-7a1e38cef46f@bytedance.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Linux-cachefs] [PATCH 0/1] cachefiles: Add a command to restore
 on-demand requests
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
Cc: linux-fsdevel@vger.kernel.org, zhujia.zj@bytedance.com,
 linux-cachefs@redhat.com, linux-erofs@lists.ozlabs.org, chao@kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Hi David, Jeffle & Xiang

In production environment, process crashes sometimes occurs.

In cachefiles on-demand read scenario, if user daemon crashes,
requests will return -EIO.
User programs which do not consider this error will trap into
uncertain state.

Based on this, we came up with a user daemon crash recover scheme.
Even if user daemon crashes, the device connection and anonymous fd
will not be released. Recovered user daemon only needs to write 'restore'
to /dev/cachefiles to restore in-flight requests.

Userspace Crash Recover Demo (Based on Jeffle's User Demo)
--------------------------
Git tree:
	https://github.com/userzj/demand-read-cachefilesd.git main
Gitweb:
	https://github.com/userzj/demand-read-cachefilesd

Jia Zhu (1):
   cachefiles: Add a command to restore on-demand requests

  fs/cachefiles/daemon.c   |  1 +
  fs/cachefiles/internal.h |  3 +++
  fs/cachefiles/ondemand.c | 25 +++++++++++++++++++++++++
  3 files changed, 29 insertions(+)

-- 
2.20.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

