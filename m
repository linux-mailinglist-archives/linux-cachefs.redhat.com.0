Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEFB5A1272
	for <lists+linux-cachefs@lfdr.de>; Thu, 25 Aug 2022 15:37:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661434629;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RGhBbiO9T9FrvHfS5U67/N0IxLkm/XIGWHIh6R2toJc=;
	b=jA2lFFvCCFZjyKntUbZwZz8xi/Aijod5g1hcauaU85S5qewMXTjmN8qCm3bgiLj1VFemLz
	AX1S2EzR87/8wUR3BNbep3wu7P1xcda2jLfAduWctWrb9x8VQ6h9ch1DbykR7tglQ40gyW
	25KD3INEFBJ4BYuKS/hgzRHWpSLSyO4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-eUYbD8saPvWF0DYkXEXXGA-1; Thu, 25 Aug 2022 09:37:06 -0400
X-MC-Unique: eUYbD8saPvWF0DYkXEXXGA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A83DB380453F;
	Thu, 25 Aug 2022 13:37:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3F18F1415117;
	Thu, 25 Aug 2022 13:37:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F356F1946A5E;
	Thu, 25 Aug 2022 13:37:02 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EA6AA1946A43 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 25 Aug 2022 13:37:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A7582400EA8B; Thu, 25 Aug 2022 13:37:01 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A298540B40C8
 for <linux-cachefs@redhat.com>; Thu, 25 Aug 2022 13:37:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86F5480231E
 for <linux-cachefs@redhat.com>; Thu, 25 Aug 2022 13:37:01 +0000 (UTC)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-fC-HbSjbP6KtuYivoY1cSQ-1; Thu, 25 Aug 2022 09:36:59 -0400
X-MC-Unique: fC-HbSjbP6KtuYivoY1cSQ-1
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27PD9Po5004590;
 Thu, 25 Aug 2022 13:36:45 GMT
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j55nycv0v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Aug 2022 13:36:45 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 27PBEBkA021748; Thu, 25 Aug 2022 13:36:44 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3j5n5pax7x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Aug 2022 13:36:44 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CY4PR10MB1957.namprd10.prod.outlook.com
 (2603:10b6:903:127::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Thu, 25 Aug
 2022 13:36:42 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5546.024; Thu, 25 Aug 2022
 13:36:42 +0000
Date: Thu, 25 Aug 2022 16:36:20 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <20220825133620.GB2071@kadam>
References: <20220818125038.2247720-1-sunke32@huawei.com>
 <3700079.1661336363@warthog.procyon.org.uk>
 <c6fd70dd-2b0b-ea9f-f0f8-9d727cde2718@linux.alibaba.com>
In-Reply-To: <c6fd70dd-2b0b-ea9f-f0f8-9d727cde2718@linux.alibaba.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0072.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::23)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f963b080-6aa8-4897-599c-08da869ed763
X-MS-TrafficTypeDiagnostic: CY4PR10MB1957:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: ESa3BahihUCpZhb0Lpt54ipEmAGtjyoaYuGI47bmJkVzzRBAr+pjTNi1wVbRv3qyJUQP73ggldcjglgSRgRoPyKxPEvmIClGPKEJosBd50wAu6QBQA08txA5cpCS1iNg5JoFVhEC0lEg3zPnxT6bqYnRmKwLrgCuLVxLvCaraoq4ScDF3ZIqMFgQ0/1ssVcgz8ZdVkd4xRx/eesRN0s00vkSU6TD4bwAj7r9ZIy4woDwuRgn9hZMkKF6gTNkK+GXvMydlrbVyZeDCacXv1OAavVA62ZL6EusRHZ01ovGVcebZMXMBh7EyLWp+sb5phpX2LB1tP+HULpje1ywyiDgEbIyLYc/DeIbNmWtlOmYh5V9RN8miq5g37iqJ6JVnNKqs6qhFwDU/b0LaaNaVrDEZ5RfKFoA5L8Xplg5iVCYZfDo8mhHss2oZGRk7JkYahyLJo/RY+3FBYh9l6L3R/cu/D3Yuv2YtxoG2v70vEzCsO1vCeg3JOIhsITy8YrFtzPgOzKUl30158IDU59rlsc4Qdrvqtw+bZmWoi7FyOEx4zWYIvI5UlYUcC1xiS7/kFvqtxpGclS2d+S5pk/Pcs/OrDCWlbkPbqhTDngFA4KvuM4f2emK3zCOsBAXEFHPjYTTN2YU9wd3LolnEiV1HF7IzfeyInNdYXgdZ+DhJztxCD+h2xu6BVXbIIo7FZW0Nh83fpYPeHwrEfGAu+sVzwoIVSAQP2rlv+Hcqsz1kyPMA91bwLFquCgCPvtyikJaXE+RfYs1nte5b9qs8yTM3JwFmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(396003)(346002)(366004)(39860400002)(136003)(376002)(33656002)(86362001)(38100700002)(6486002)(52116002)(83380400001)(478600001)(6512007)(186003)(41300700001)(9686003)(6666004)(26005)(6506007)(38350700002)(6916009)(33716001)(316002)(8676002)(5660300002)(66476007)(54906003)(1076003)(66556008)(2906002)(66946007)(8936002)(44832011)(4326008)(4744005);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xamxPXlmRb05EiOU/LHJl14sDwrMDAUbSFyjZCJ37zFr2YSjT6PLQwyTMeHX?=
 =?us-ascii?Q?hDK9wWPY1bmQSLECDQo31U7xYe8DPEULgY/Yee+aH89sxtvHpQUCUrE1dOXU?=
 =?us-ascii?Q?O/SEwtX4LqQppmbBeRlSYajLM9R7yr7mmgy61GkCJLKYWncC2C8odhP3WiF4?=
 =?us-ascii?Q?VyBMmxwFMI9EhlJbBoSsTlC0VopCgcodj7QTqsdyjSTHCRZe1z0htCqhvYkz?=
 =?us-ascii?Q?b3JFOohVLHcVlb1MoQt5a9emVe3fetHktl2WmxdJP8rTXqyOFpo31K1Ex57d?=
 =?us-ascii?Q?LavLFo9Jo6B/C42aiwr2DFMCrv9X7CXVvLn4Q71RbewkHQTgKAvVu9PRT/X4?=
 =?us-ascii?Q?R0aYq00CRH6DNK99JfEOE1Vh5iZeeleVkjDBQ++mfJtzUIEESgmie7mG1Nm1?=
 =?us-ascii?Q?36FPh4r6zQHpeZc06hFfQX3EeKtZoelZ5Ug6JUr9qf/BrVcFa3+qyEZi8hNJ?=
 =?us-ascii?Q?+4JYFHO2oAzLy3OuIwCbQpJrCzOZqN3Kp03PWhMNxefVN10NZ73lj+Ezojlw?=
 =?us-ascii?Q?6sAUxIKMxkQjqma8sgkmJUFZiSsmK3OwzZKw4LmNIScOfZIyyR4+MteuvR9N?=
 =?us-ascii?Q?5KUgwMJ8Hihg66s/TvIiMqGgbI0kp6GZ2oU92uuNpUxlja3Ta73TM/wPziuU?=
 =?us-ascii?Q?nEIgA/wglX1DoNdXg4G0Ia6SXvhWi/jefyr39hD0y7KhNt6lor0s6YqFQS7N?=
 =?us-ascii?Q?rdvDfQdvdSrcHdZv4axMOsRWPi9kX0miPeIDdccCw3ouZw/pGK1ix2YHSh2W?=
 =?us-ascii?Q?mrJtPqVtD4nXOeueWbWfiwyozjs/QyYxPASl7uBtWwButHJMS+t7emeh2Jjx?=
 =?us-ascii?Q?Wvo1CodnissAq6xdSha9Mr5ln0Q4Dj7fxMq2zjbyFYxPHAU6jSgHEonIX2Za?=
 =?us-ascii?Q?pyuo+Qxdww3mNHucP0kT1iwhlmrbFilMPJIJdalues77QgSV178noSYaX1n2?=
 =?us-ascii?Q?u80hFtU0tFjutUZhs2ORL+pSAMLW9550bBDztj3Qmr7wQJl+n/+Sd+KHJ59S?=
 =?us-ascii?Q?QdEeqUh3qFg+S2JrkVazvwsMy34IJIKXo25jjWQqssv+h4X/n8e+xHkao0VP?=
 =?us-ascii?Q?CnefgWm4rg9Jq7XXNRV4Rs6ffzsKzYZpNWb6QaDhM94C8E1KANkpBrpquZIv?=
 =?us-ascii?Q?/icWk98uRAsiGRTGM5V3IVW1H0rLStPvGgXRkaOdwYaQ7kSkrY7MrAOazNU3?=
 =?us-ascii?Q?N+zJNaHw5fFgwgKSINSfKSHWTdYW6eDaVdwdLjHgZ5A+P+8OT0W7ApwK+LQ5?=
 =?us-ascii?Q?W0K66jvGyMjkT/bm2R16qqOaMDW8qxFwiOzT3jj/1i/kJeVDqnfXSX0NDUFX?=
 =?us-ascii?Q?/FknZoYlpuMBxg4GahUqOcJqE0LMFfMH1aE/IBMpOcAuwqC8RJc1eOkbLJSx?=
 =?us-ascii?Q?tcSpqN1DjGd4ItZXwqBZ3U2+F0HpNYr51gxkAZv62qj8FVEWmAvKpOmNObEh?=
 =?us-ascii?Q?/D3VNVonpwEvu7UkOL0xeKD+s+blg+cxgzcN+jrydDoARhwOj3J4vzvcqyqw?=
 =?us-ascii?Q?kw8k4zWiPdOeFKRw+yBcU3a7jDXOkUMLc+sispXDrtYDDVLvKOuDXzJDoCHF?=
 =?us-ascii?Q?dUNuRnQtntiRzNSU3Rnns3hU+QJMBB7kK8EGpOn9JEgXtt4s77Rf0ZfUkWWc?=
 =?us-ascii?Q?Rg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f963b080-6aa8-4897-599c-08da869ed763
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 13:36:42.4630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eDEuHUopfsypHcaNFwgG0u+HyrGbwCdeFu05JxdUmFbEVzlOi1nFrJaOnaSALcLh6tcaIb9GspHctJdXLnQiVAGxtcT7HRMgxEsutb4SpCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1957
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-25_05,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 phishscore=0 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208250051
X-Proofpoint-ORIG-GUID: tNUt_tbhSYzIjonqQY57M3xJBJ1lxwCg
X-Proofpoint-GUID: tNUt_tbhSYzIjonqQY57M3xJBJ1lxwCg
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [Linux-cachefs] [PATCH v3] cachefiles: fix error return code in
 cachefiles_ondemand_copen()
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
 Sun Ke <sunke32@huawei.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I spent a long time looking at this as well...  It's really inscrutable
code.  It would be more readable if we just spelled things out in the
most pedantic way possible:

diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
index 1fee702d5529..7e1586bd5cf3 100644
--- a/fs/cachefiles/ondemand.c
+++ b/fs/cachefiles/ondemand.c
@@ -158,9 +158,13 @@ int cachefiles_ondemand_copen(struct cachefiles_cache *cache, char *args)
 
 	/* fail OPEN request if daemon reports an error */
 	if (size < 0) {
-		if (!IS_ERR_VALUE(size))
-			size = -EINVAL;
-		req->error = size;
+		if (!IS_ERR_VALUE(size)) {
+			req->error = -EINVAL;
+			ret = -EINVAL;
+		} else {
+			req->error = size;
+			ret = 0;
+		}
 		goto out;
 	}
 

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

