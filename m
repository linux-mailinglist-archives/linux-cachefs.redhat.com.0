Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0D276C6EE
	for <lists+linux-cachefs@lfdr.de>; Wed,  2 Aug 2023 09:35:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690961702;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post:autocrypt:autocrypt;
	bh=BDyMHIQY9e1JhhFOHrItUVTW5sC5effOoBnitjryLTI=;
	b=dTN6vpVRtTEl1T/HIpmYtAye0/nZQ2oaTN+h/QBhsYZzjvqKnEcATbYYv/vEvHpIhovPrl
	CKT2YEAWqrWDn3R8A4KdJ4ieQozzCcgvQOmOhIudntTDfILsatoec3ycMUIX/1rQvGGCMr
	rFtZqnBwaswXeRImO1cGcNJCUG4wzlI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-84Xi95amMwajOIqWB46e4g-1; Wed, 02 Aug 2023 03:34:59 -0400
X-MC-Unique: 84Xi95amMwajOIqWB46e4g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32AAD80027F;
	Wed,  2 Aug 2023 07:34:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4C69E40C2063;
	Wed,  2 Aug 2023 07:34:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B50C11946A72;
	Wed,  2 Aug 2023 07:34:57 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 785951946A43 for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  2 Aug 2023 07:34:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 57753492CA6; Wed,  2 Aug 2023 07:34:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F3E6492B03
 for <linux-cachefs@redhat.com>; Wed,  2 Aug 2023 07:34:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32F4610119E1
 for <linux-cachefs@redhat.com>; Wed,  2 Aug 2023 07:34:27 +0000 (UTC)
Received: from mail.salscheider.org (salscheider.org [202.61.254.1]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-607-MEgqnXCnMu-BeLAM3ClTIQ-1; Wed,
 02 Aug 2023 03:34:25 -0400
X-MC-Unique: MEgqnXCnMu-BeLAM3ClTIQ-1
Received: from [IPV6:2003:a:d79:b301:af9:7d5:1d18:29f2] (unknown
 [IPv6:2003:a:d79:b301:af9:7d5:1d18:29f2])
 by mail.salscheider.org (Postfix) with ESMTPSA id 635EC38B781E
 for <linux-cachefs@redhat.com>; Wed,  2 Aug 2023 09:28:48 +0200 (CEST)
Message-ID: <4b41feb3-cfa6-6a74-6505-d9a049139eb3@salscheider.org>
Date: Wed, 2 Aug 2023 09:28:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-cachefs@redhat.com
From: Ole Salscheider <ole@salscheider.org>
Autocrypt: addr=ole@salscheider.org; keydata=
 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
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Linux-cachefs] Files read from NFS instead of fscache when also in
 pagecache
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: salscheider.org
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Hello,

I noticed some strange behaviour of fscache with kernel 6.4.x in 
combination with NFS (v4.2) and the pagecache.

I have multiple clients mounting an NFS v4.2 file system from a server 
and caching the data locally using fscache. After booting the clients, 
most data is served from fscache and only a few requests hit the NFS 
server. But after some minutes of operation (which typically includes a 
lot of cyclic data reading for us), fewer and fewer files are served 
from fscache and most are served by the NFS server.
It seems that this has something to do with the files being also in the 
pagecache. If I periodcally drop the pagecache with "echo 3 > 
/proc/sys/vm/drop_caches", then most of the files are served from 
fscache again.

Is this a known problem? If not, do you have any suggestion how I can 
try to find the root cause?

Thank you in advance!

Best regards,

Ole

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

