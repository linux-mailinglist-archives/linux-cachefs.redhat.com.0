Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A37062EE92
	for <lists+linux-cachefs@lfdr.de>; Fri, 18 Nov 2022 08:43:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668757382;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YOd2b0xmHXlCIv1VLE1r7vLE0AYifN4JZQAP6o509zU=;
	b=f9VRZg3JRCDAA/U1BDN343UbAAmf9guCZXYJeDvJJcp1fMi9Ie5XcKGG6pdXC9q7mA6Yxv
	q4g4BOXmdFsJ8ejn62Ooo16TgOnLiBwGM+VX30t0lPaIIpmz7vx9MEbA7NjCyWgJM0ELCN
	SqG11cyM6wPZLgiaQ/hqknrL0cOCz8M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-MOupSureN9q8-idU5Y2PHw-1; Fri, 18 Nov 2022 02:42:59 -0500
X-MC-Unique: MOupSureN9q8-idU5Y2PHw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D71A101A52A;
	Fri, 18 Nov 2022 07:42:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3FA6F2027063;
	Fri, 18 Nov 2022 07:42:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1DC9C19465B8;
	Fri, 18 Nov 2022 07:42:57 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 97F3319465A8 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 18 Nov 2022 07:09:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 851A3492B0F; Fri, 18 Nov 2022 07:09:10 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CF05492B04
 for <linux-cachefs@redhat.com>; Fri, 18 Nov 2022 07:09:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62736185A79C
 for <linux-cachefs@redhat.com>; Fri, 18 Nov 2022 07:09:10 +0000 (UTC)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com
 [45.249.212.189]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-OBas6pmsNp6UYnilERKYyg-1; Fri, 18 Nov 2022 02:09:07 -0500
X-MC-Unique: OBas6pmsNp6UYnilERKYyg-1
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4ND79D6mcHzJnqQ;
 Fri, 18 Nov 2022 15:05:52 +0800 (CST)
Received: from kwepemm600020.china.huawei.com (7.193.23.147) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 18 Nov 2022 15:09:03 +0800
Received: from [10.174.179.160] (10.174.179.160) by
 kwepemm600020.china.huawei.com (7.193.23.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 18 Nov 2022 15:09:02 +0800
Message-ID: <2f428592-f084-a36f-42ba-709848c460c4@huawei.com>
Date: Fri, 18 Nov 2022 15:09:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: David Howells <dhowells@redhat.com>
References: <54854a71-5856-f80f-d8cb-ab75b826ba5f@huawei.com>
 <166869954095.3793579.8500020902371015443.stgit@warthog.procyon.org.uk>
 <4193090.1668754852@warthog.procyon.org.uk>
From: "zhangpeng (AS)" <zhangpeng362@huawei.com>
In-Reply-To: <4193090.1668754852@warthog.procyon.org.uk>
X-Originating-IP: [10.174.179.160]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600020.china.huawei.com (7.193.23.147)
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Fri, 18 Nov 2022 07:42:56 +0000
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [Linux-cachefs] [PATCH] fscache: fix OOB Read in
 __fscache_acquire_volume
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
Cc: lucho@ionkov.net, asmadeus@codewreck.org, linux_oss@crudebyte.com,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 syzbot+a76f6a6e524cf2080aa3@syzkaller.appspotmail.com,
 linux-cachefs@redhat.com, v9fs-developer@lists.sourceforge.net
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

> zhangpeng (AS)<zhangpeng362@huawei.com>  wrote:
>
>> Thanks for your advice. The size needs to be able to hold up to 255 to
>> handle larger keys. After testing, this patch works fine.
> Can I put you down as a Reviewed-by or Tested-by?
>
> Thanks,
> David

Of course, you can.
Reviewed-by: Zhang Peng<zhangpeng362@huawei.com>

Zhang Peng
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

