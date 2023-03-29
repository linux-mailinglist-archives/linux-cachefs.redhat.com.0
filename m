Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3746CD0B4
	for <lists+linux-cachefs@lfdr.de>; Wed, 29 Mar 2023 05:33:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680060830;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=D0yvFz43HhLziwWJNNzPMe1R0wvKJ4ijQ+QmPRsCIlM=;
	b=Pqqxr36lMeyBI+7Tpb84UeyC2V2amvRXI0wOJQW0D/gPRHh9jCfvzimGcS/6utLB8n9Y+k
	vqEc6qeH/+QvWG5M7cFV42zQ5TxUZXltTA9KENm4DpyYZkoF8Foe4GSkc25HpCfzbHnQPV
	gk2IkrGMgjI7JtQ7+QPTS8JKF/iFFA4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-j4kErdTPOhKSLgbdyPyziw-1; Tue, 28 Mar 2023 23:33:47 -0400
X-MC-Unique: j4kErdTPOhKSLgbdyPyziw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F10E185A7A4;
	Wed, 29 Mar 2023 03:33:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9B8C41121330;
	Wed, 29 Mar 2023 03:33:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 54DFA1946597;
	Wed, 29 Mar 2023 03:33:45 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2E460194658C for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 29 Mar 2023 03:33:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A2311440D7; Wed, 29 Mar 2023 03:33:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AC87FD6E
 for <linux-cachefs@redhat.com>; Wed, 29 Mar 2023 03:33:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3BA1F3802B8A
 for <linux-cachefs@redhat.com>; Wed, 29 Mar 2023 03:33:40 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-0_o1PTNvNwSlDT_vELHw_Q-1; Tue, 28 Mar 2023 23:33:38 -0400
X-MC-Unique: 0_o1PTNvNwSlDT_vELHw_Q-1
Received: by mail-pj1-f43.google.com with SMTP id
 lr16-20020a17090b4b9000b0023f187954acso14803427pjb.2
 for <linux-cachefs@redhat.com>; Tue, 28 Mar 2023 20:33:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680060817;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4+TATKpiI/m1aX5zcJcBfi55zhCtiMGHrjCscJ6PomI=;
 b=z3ZFD4twzVNeSX3lILtT+WcJe/YbXeGuwRHCyuMGiyVtfLxQ+r3Bt6Uim/uwCwzhzB
 GgQ9EXAmiJrCczK5zbZvQt7WwzXD/JdxBSXQxzz0uQfMey0iKz6D/vKNcgMO5sEFI/5D
 8vgQ6ycSQZlnf2I4BbYP3CvS4cs46aNs9smrfNE//49Y0Iznksy26PcWyhLu9bkgbqFp
 lJXTaBVwnfmgWDzD+BHuJsVA7h4dGhlk/ebpZID2jIZJ9Df2N7sT+/PcLmVrmyOgFiQL
 2AE6/uGvEYFwyzgGmtNMT04GEjaPg64L52KvOra7ZE8GtFrsTOx9k5zMU2n8VqCwCHHi
 glDQ==
X-Gm-Message-State: AAQBX9e4Bz0FqqWN6QW9G6SvNjrI+0hDHYHoE1bLWrXaJkOFgJgagBjW
 dN/UB396bet8KjQMSlttjo7Abg==
X-Google-Smtp-Source: AKy350avfa0gKz4Zd6gsYPNpRBHU5Bq4LY4VQkUnGwedVUVb52Mza3ZZUfXF1Abdzp/MXze4iNGrjw==
X-Received: by 2002:a17:903:743:b0:1a1:cd69:d301 with SMTP id
 kl3-20020a170903074300b001a1cd69d301mr15834742plb.68.1680060817286; 
 Tue, 28 Mar 2023 20:33:37 -0700 (PDT)
Received: from [10.3.144.50] ([61.213.176.7]) by smtp.gmail.com with ESMTPSA id
 k16-20020a63f010000000b004fbd021bad6sm20505062pgh.38.2023.03.28.20.33.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 20:33:36 -0700 (PDT)
Message-ID: <a9952336-4648-16be-532a-37fd52d67b27@bytedance.com>
Date: Wed, 29 Mar 2023 11:33:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
To: David Howells <dhowells@redhat.com>
References: <20230111052515.53941-2-zhujia.zj@bytedance.com>
 <20230111052515.53941-1-zhujia.zj@bytedance.com>
 <131869.1680011531@warthog.procyon.org.uk>
From: Jia Zhu <zhujia.zj@bytedance.com>
In-Reply-To: <131869.1680011531@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Linux-cachefs] [PATCH V4 1/5] cachefiles: introduce object
 ondemand state
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
Cc: linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

SGkgRGF2aWQsClRoYW5rcyBmb3IgcmV2aWV3aW5nLgoK5ZyoIDIwMjMvMy8yOCAyMTo1MiwgRGF2
aWQgSG93ZWxscyDlhpnpgZM6Cj4gSmlhIFpodSA8emh1amlhLnpqQGJ5dGVkYW5jZS5jb20+IHdy
b3RlOgo+IAo+PiArZW51bSBjYWNoZWZpbGVzX29iamVjdF9zdGF0ZSB7Cj4+ICsJQ0FDSEVGSUxF
U19PTkRFTUFORF9PQkpTVEFURV9jbG9zZSwgLyogQW5vbnltb3VzIGZkIGNsb3NlZCBieSBkYWVt
b24gb3IgaW5pdGlhbCBzdGF0ZSAqLwo+PiArCUNBQ0hFRklMRVNfT05ERU1BTkRfT0JKU1RBVEVf
b3BlbiwgLyogQW5vbnltb3VzIGZkIGFzc29jaWF0ZWQgd2l0aCBvYmplY3QgaXMgYXZhaWxhYmxl
ICovCj4gCj4gVGhhdCBsb29rcyB3ZWlyZC4gIE1heWJlIG1ha2UgdGhlbSBhbGwtbG93ZXJjYXNl
PwoKSSdsbCByZXZpc2UgaXQgaW4gbmV4dCB2ZXJzaW9uLgo+IAo+PiBAQCAtMjk2LDYgKzMwMiwy
MSBAQCBleHRlcm4gdm9pZCBjYWNoZWZpbGVzX29uZGVtYW5kX2NsZWFuX29iamVjdChzdHJ1Y3Qg
Y2FjaGVmaWxlc19vYmplY3QgKm9iamVjdCk7Cj4+ICAgZXh0ZXJuIGludCBjYWNoZWZpbGVzX29u
ZGVtYW5kX3JlYWQoc3RydWN0IGNhY2hlZmlsZXNfb2JqZWN0ICpvYmplY3QsCj4+ICAgCQkJCSAg
ICBsb2ZmX3QgcG9zLCBzaXplX3QgbGVuKTsKPj4gICAKPj4gKyNkZWZpbmUgQ0FDSEVGSUxFU19P
QkpFQ1RfU1RBVEVfRlVOQ1MoX3N0YXRlKQlcCj4+ICtzdGF0aWMgaW5saW5lIGJvb2wJCQkJCQkJ
CVwKPj4gK2NhY2hlZmlsZXNfb25kZW1hbmRfb2JqZWN0X2lzXyMjX3N0YXRlKGNvbnN0IHN0cnVj
dCBjYWNoZWZpbGVzX29iamVjdCAqb2JqZWN0KSBcCj4+ICt7CQkJCQkJCQkJCQkJXAo+PiArCXJl
dHVybiBvYmplY3QtPnN0YXRlID09IENBQ0hFRklMRVNfT05ERU1BTkRfT0JKU1RBVEVfIyNfc3Rh
dGU7IFwKPj4gK30JCQkJCQkJCQkJCQlcCj4+ICsJCQkJCQkJCQkJCQlcCj4+ICtzdGF0aWMgaW5s
aW5lIHZvaWQJCQkJCQkJCVwKPj4gK2NhY2hlZmlsZXNfb25kZW1hbmRfc2V0X29iamVjdF8jI19z
dGF0ZShzdHJ1Y3QgY2FjaGVmaWxlc19vYmplY3QgKm9iamVjdCkgXAo+PiArewkJCQkJCQkJCQkJ
CVwKPj4gKwlvYmplY3QtPnN0YXRlID0gQ0FDSEVGSUxFU19PTkRFTUFORF9PQkpTVEFURV8jI19z
dGF0ZTsgXAo+PiArfQo+PiArCj4+ICtDQUNIRUZJTEVTX09CSkVDVF9TVEFURV9GVU5DUyhvcGVu
KTsKPj4gK0NBQ0hFRklMRVNfT0JKRUNUX1NUQVRFX0ZVTkNTKGNsb3NlKTsKPiAKPiBPciBqdXN0
IGdldCByaWQgb2YgdGhlIG1hY3JvaXNhdGlvbj8gIElmIHRoZXJlIGFyZSBvbmx5IHR3byBzdGF0
ZXMsIGl0IGRvZXNuJ3QKPiBzYXZlIHlvdSB0aGF0IG11Y2ggYW5kIGl0IG1lYW5zIHRoYXQgIm1h
a2UgVEFHUyIgd29uJ3QgZ2VuZXJhdGUgcmVmcyBmb3IgdGhvc2UKPiBmdW5jdGlvbnMgYW5kIGdy
ZXAgd29uJ3QgZmluZCB0aGVtLgoKQWN0dWFsbHkgdGhlcmUgaXMgb25lIG1vcmUgc3RhdGUgPHJl
b3BlbmluZz4gd2lsbCBiZSBpbnRyb2R1Y2VkIGluCnBhdGNoMyBhbmQgMzArIGxvYyBmb3IgcmVw
ZWF0ZWQgZnVuY3Rpb25zIHdpbGwgYmUgYWRkZWQgaWYgd2UgZHJvcCB0aGUgCm1hY3JvLgpTaGFs
bCBJIGtlZXAgdXNpbmcgdGhlIG1hY3JvIG9yIHJlcGxhY2UgaXQ/Cj4gRGF2aWQKCi0tCkxpbnV4
LWNhY2hlZnMgbWFpbGluZyBsaXN0CkxpbnV4LWNhY2hlZnNAcmVkaGF0LmNvbQpodHRwczovL2xp
c3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWNhY2hlZnMK

